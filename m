From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 14:58:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/genimage: use git version,
 bump to latest
In-Reply-To: <1442929734-26752-1-git-send-email-imrehg@gmail.com>
References: <1442929734-26752-1-git-send-email-imrehg@gmail.com>
Message-ID: <5602AFF6.5000701@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gergely Imreh,

On 09/22/2015 02:48 PM, imrehg at gmail.com wrote:
> From: Gergely Imreh <imrehg@gmail.com>
> 
> Using the latest release 7 of genimage on Arch Linux at the
> moment seems to result in segmentation fault, while it works on
> other distros. The latest git version on the other hand runs
> correctly on all platforms tested. Test was done by running:
> "make wandboard_defconfig && make" as Wandboard is using genimage
> in the post-image script.
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>
> ---
>  package/genimage/genimage.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index 07d95a4..773d515 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -GENIMAGE_VERSION = 7
> -GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
> -GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
> +GENIMAGE_VERSION = f23b67b7e3c57712c22e226742566e206cfb43be
> +GENIMAGE_SITE = git://git.pengutronix.de/git/genimage.git

a new version of genimage has been released today, and Vivien Didelot is
providing a patch to bump from version 7 to version 8:

http://patchwork.ozlabs.org/patch/521695/

His patch supersedes yours, so, could you please mark your patch as
superseded in Patchwork.

Thanks,

Vincent.


>  GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
>  GENIMAGE_LICENSE = GPLv2
> +GENIMAGE_AUTORECONF = YES
>  
>  $(eval $(host-autotools-package))
> 
