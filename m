From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:12:45 +0200
Subject: [Buildroot] [PATCH 1 of 3] host-acl: build fix on RHEL6 hosts
 (GCC 4.4.7)
In-Reply-To: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
Message-ID: <20180725231245.7e1e2f99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 10:20:42 -0700, Hollis Blanchard wrote:
> This didn't introduce any build warnings, FWIW.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> 
> diff --git a/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
> new file mode 100644
> --- /dev/null
> +++ b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
> @@ -0,0 +1,21 @@
> +build with old GCC versions
> +
> +GCC 4.4.7, as found in RHEL6, reports:
> +	libacl/acl_from_text.c:307: error: #pragma GCC diagnostic not allowed inside functions
> +
> +Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

Are you sure removing this won't break the build with newer gcc
versions ?

In any case, for all three of your patches, could you please use Git to
generate the package patches themselves ? All three packages being
patched use Git upstream, and we very much like having Git formatted
patches in this case.

However, a larger question is: do you intend to contribute an
autobuilder that tests Buildroot under RHEL6 ? Indeed, you are fixing
just the few packages that are useful to you, but if we are going to
support something as old as RHEL6, then we need to do it properly and
have an autobuilder running on this distro. Do you think this is
something that could be done ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
