From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 08:09:45 +0100
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5100DE39.70308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 23:55, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> ---
>   fs/common.mk      |  8 +++++++-
>   fs/cpio/Config.in | 18 ++++++++++++++----
>   2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index 8b5b2f2..0c171fc 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -39,7 +39,7 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
>   define ROOTFS_TARGET_INTERNAL
>
>   # extra deps
> -ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
> +ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)

  Gustavo,

  If you were to submit a v4, could you split this very long line?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
