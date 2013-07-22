From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 22 Jul 2013 08:49:30 +0200
Subject: [Buildroot] [PATCH 3 of 3] linux/uboot: line-up
 repository-related configuration options
In-Reply-To: <87ppubr2av.fsf@dell.be.48ers.dk>
References: <patchbomb.1374233231@BEANTN0L019720>
 <3c808c389a7d8a39cfaf.1374233234@BEANTN0L019720>
 <87ppubr2av.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWSrV+CXBnZZjqfOxeRfdCGNut2jYVKWChgXAMBxRw4uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 22-jul.-2013 00:11 schreef "Peter Korsgaard" <jacmet@uclibc.org> het
volgende:
>
> >>>>> "Thomas" == Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> writes:
>
>  Thomas> Although the configuration options for custom repository
locations and
>  Thomas> versions are very similar between the linux and uboot packages,
there are
>  Thomas> some minor differences. This patch lines up both packages.
>
>  Thomas> Signed-off-by: Thomas De Schampheleire <
thomas.de.schampheleire@gmail.com>
>
>  Thomas> ---
>  Thomas> Note: one remaining difference is that there are help texts in
linux for
>  Thomas> options BR2_LINUX_KERNEL_CUSTOM_GIT and
BR2_LINUX_KERNEL_CUSTOM_HG. I
>  Thomas> didn't add them to uboot because it seems a bit redundant, but
if you
>  Thomas> prefer we can line this up as well (either add help texts to
uboot or
>  Thomas> remove them from linux).
>
>  Thomas>  boot/uboot/Config.in |  5 +++++
>  Thomas>  linux/Config.in      |  2 +-
>  Thomas>  2 files changed, 6 insertions(+), 1 deletions(-)
>
>  Thomas> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>  Thomas> --- a/boot/uboot/Config.in
>  Thomas> +++ b/boot/uboot/Config.in
>  Thomas> @@ -70,6 +70,11 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
>
>  Thomas>  config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
>  Thomas>        string "Custom repository version"
>  Thomas> +      default "HEAD" if BR2_TARGET_UBOOT_CUSTOM_GIT
>  Thomas> +      default "tip" if BR2_TARGET_UBOOT_CUSTOM_HG
>  Thomas> +      help
>  Thomas> +        Revision to use in the typical format used by
Git/Mercurial
>  Thomas> +        E.G. a sha id, a tag, branch, ..
>
> As mentioned for the linux change, I prefer to drop the defaults,
> otherwise it looks good.

Thanks for the feedback. I'll update and send a new set, hopefully later
this week.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130722/6649c813/attachment-0001.html>
