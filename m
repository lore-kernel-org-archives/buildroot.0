From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Oct 2013 16:57:31 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 22, 2013 at 4:37 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> U-Boot 2013.10 moved licenses into the Licenses/ directory.
> However since we target many versions of u-boot (even non-upstream
> versions) we can't point UBOOT_TOOLS_LICENSE_FILES to the proper place
> without making mistakes.
> So just remove it unforunately. Fixes:
> http://autobuild.buildroot.net/results/8c9/8c94c81fe74399c854de335329cf4942f8356fbe/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/uboot-tools/uboot-tools.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index e19372a..96d2c8d 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -8,7 +8,6 @@ UBOOT_TOOLS_VERSION = 2013.10
>  UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
>  UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>  UBOOT_TOOLS_LICENSE = GPLv2+
> -UBOOT_TOOLS_LICENSE_FILES = COPYING
>

Maybe the legal-info target should warn for non-existing files, rather
than error out.
It seems more logical to support the latest versions than to support
none, with respect to _LICENSE_FILES.
Those who build older versions of u-boot should see the warning and
handle it appropriately.

Note that in either case, we can't trust the _LICENSE directive
either: a project could change license along the way, and if buildroot
allows to select an arbitrary version in the config, the specified
LICENSE may be wrong.

Best regards,
Thomas
