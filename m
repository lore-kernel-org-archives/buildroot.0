From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Mar 2016 17:22:13 -0300
Subject: [Buildroot] [PATCH V3 1/2] Add custom Subversion repository
 support for package uboot
References: <1459099817-4614-1-git-send-email-susundberg@gmail.com>
Message-ID: <56f840f567b01_541bcc1b68680a8@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pauli,

>[PATCH V3 1/2] Add custom Subversion repository support for package uboot

Should start with one of below
uboot:
boot/uboot:
You can look at examples using
git log -- boot/uboot/

Also, you didn't addressed all Peter's suggestions from previous iterations.

On Sun, Mar 27, 2016 at 02:30 PM, Pauli Sundberg <susundberg@gmail.com> wrote:

> from: Pauli Sundberg <susundberg@gmail.com>
> date: Sun, Mar 27 08:30 PM +03:00 2016
> to: buildroot at buildroot.org
> cc: Pauli Sundberg <susundberg@gmail.com>
> subject: [Buildroot] [PATCH V3 1/2] Add custom Subversion repository support for package uboot
> 
> Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
> ---
>  boot/uboot/Config.in | 9 ++++++---
>  boot/uboot/uboot.mk  | 4 +++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index a6b9f17..de6f7aa 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -54,6 +54,9 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
>  config BR2_TARGET_UBOOT_CUSTOM_HG
>  	bool "Custom Mercurial repository"
>  
> +config BR2_TARGET_UBOOT_CUSTOM_SVN
> +        bool "Custom Subversion repository"

Should be indented using tab

> +        

Should be an empty newline, without the trailing spaces.

>  endchoice
>  
>  config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE

[snip]

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 3c96259..ae98c72 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -3,7 +3,6 @@
>  # uboot
>  #
>  ################################################################################
> -

The removal of this line should not be part of your patch

>  UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>  UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
>  

[snip]

Regards,
Ricardo
