From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 21:48:43 +0100
Subject: [Buildroot] [PATCH] fs/common.mk: Strip extra whitespace when
 device table is empty
In-Reply-To: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1363177697-31728-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <5140E62B.2040607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 13:28, Ezequiel Garcia wrote:
> Since ROOTFS_DEVICE_TABLES it is a concatenation of two strings
> separated by spaces, there will always be a space on it, which means
> it's never empty. Therefore, when testing for empty, the condition
> never evaluate to false.
>
> The following change fixes this problem; it runs the qstrip on
> the overall combination of the variables, causing the space to be
> removed if it's the only thing left.
>
> Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Signed-off-by: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(visual inspection only)


  Regards,
  Arnout

> ---
>   fs/common.mk |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index 8b5b2f2..a0b7b39 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -33,8 +33,8 @@
>
>   FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
>   FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
> -ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
> -	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
> +ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
> +       $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>
>   define ROOTFS_TARGET_INTERNAL
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
