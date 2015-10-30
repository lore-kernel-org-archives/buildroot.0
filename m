From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 17:54:09 +0100
Subject: [Buildroot] [PATCH] sudo: fix -fstack-protector detection
In-Reply-To: <1446221135-10180-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1446221135-10180-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5633A0B1.6000503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-10-15 17:05, Vicente Olivert Riera wrote:
> Backport a patch series from upstream to fix the configure check for
> -fstack-protector.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/bdd3e5352aa283b96717202a794f9762d15cc736/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(I haven't looked at the actual changes, just at how the patches are integrated.)

 But see below.

> ---
>  ...etter-configure-test-for-fstack-protector.patch |  415 ++++++++++++++++++++
>  ...LDFLAGS-when-checking-for-stack-protector.patch |   81 ++++
>  ...program-when-checking-for-stack-protector.patch |  189 +++++++++
>  3 files changed, 685 insertions(+), 0 deletions(-)
>  create mode 100644 package/sudo/0002-Better-configure-test-for-fstack-protector.patch
>  create mode 100644 package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch
>  create mode 100644 package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch
> 
> diff --git a/package/sudo/0002-Better-configure-test-for-fstack-protector.patch b/package/sudo/0002-Better-configure-test-for-fstack-protector.patch
> new file mode 100644
> index 0000000..b9ec410
> --- /dev/null
> +++ b/package/sudo/0002-Better-configure-test-for-fstack-protector.patch
> @@ -0,0 +1,415 @@
> +Better configure test for -fstack-protector. Some gcc installations may
> +be missing the ssp library even though the compiler supports it.

 Since you have the full HG commit log below, it's not needed to repeat that
here. Perhaps adding a single-line subject is nice though for easier conversion
to git patches. But this remark is more for the future, it's OK as it is.

> +
> +Backported from upstream:
> +  http://www.sudo.ws/repos/sudo/rev/4ade5d1249f4
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +
> +# HG changeset patch
> +# User Todd C. Miller <Todd.Miller@courtesan.com>
> +# Date 1446137469 21600
> +# Node ID 4ade5d1249f483c4dd6c579c70b327791094afe8
> +# Parent  97ee37d905ceefa433e93a0f552c2a3e5926e2fb
> +Better configure test for -fstack-protector.  Some gcc installations
> +may be missing the ssp library even though the compiler supports it.
> +
> +diff -r 97ee37d905ce -r 4ade5d1249f4 configure
> +--- a/configure	Sun Oct 25 14:28:38 2015 -0600
> ++++ b/configure	Thu Oct 29 10:51:09 2015 -0600

 It's weird that upstream maintains their configure scripts in hg, but since
they do, we indeed don't need to autoreconf.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
