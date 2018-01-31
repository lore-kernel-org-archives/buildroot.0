From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 31 Jan 2018 15:57:28 +0100
Subject: [Buildroot] [PATCH 1/1] udftools: new package
In-Reply-To: <20180122213138.11855-1-skenton@ou.edu>
References: <20180122213138.11855-1-skenton@ou.edu>
Message-ID: <20180131145728.GD13531@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Mon, Jan 22, 2018 at 03:31:38PM -0600, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> I computed the hash below for the license file but I did not see any others under the package directory
> so I think I must be misunderstanding where it should go from my reading of the on-line manual

?

> # Locally computed
> sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> I ran ./utils/check-package package/udftools/* and fixed up all the white space errors
> But I'm not sure what to do with ./utils/test-pkg, do I need to build all 47 tools chains?
> I tried ./utils/test-pkg -p udftools -c udftools.snippet (contents below) but just got errors
> BR2_PACKAGE_UDFTOOLS=y
> diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
> new file mode 100644
> index 0000000..b297edf
> --- /dev/null
> +++ b/package/udftools/udftools.hash
> @@ -0,0 +1,2 @@
> +# Locally computed

Sorry, I don't understand your comments. The computed hash should go
here

> +sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz
sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING


> diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
> new file mode 100644
> index 0000000..708fef9
> --- /dev/null
> +++ b/package/udftools/udftools.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# udftools
> +#
> +################################################################################
> +
> +UDFTOOLS_VERSION = 2.0
> +UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
> +UDFTOOLS_LICENSE = GPL-2.0+

The license is "GPL-2.0".

> +UDFTOOLS_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> -- 
> 2.9.0.137.gcf4c2cf
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180131/2c2695f6/attachment.asc>
