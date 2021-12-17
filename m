Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ABDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6341540C3F;
	Fri, 17 Dec 2021 21:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9cP5Qhc2j5o; Fri, 17 Dec 2021 21:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC01840192;
	Fri, 17 Dec 2021 21:51:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 208061BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DE1240C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wD7w_P3Uy8OS for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99CD340192
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:51:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g14so12905308edb.8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7NXg8Jqlawz9hTl7QVYtiAoW5g5gmJUEhCozASimjLY=;
 b=SYk++7PWmDqlWvrUIv0jVgcgb1SNNS3j4rvSFJD2aJA+SXTLClR+kjJam4Xyr0nFn/
 +gAA2ZysKLRLLD7PbsYVXxkNH8ZmiATRz/70w87+I7Awek3PKwPcGhmd+4w8fzh4byZ9
 LzxdJ0jLJ96jcTWF2uwqUTq7XLXj9Rv/9OprIWnGyPh62qcxLo2sAUXuYl9KqbTawj2S
 GPzJQbG5eq54pQ6vToA3PE+G30wEXpn7vf8ML15R/MBoDDlvY1WXpc1Thl70XflhMz1X
 8snzrRcfv7wNuGpA1m/NVrehQhdCpjW1HfjvUNow6L6Z7M3vTNXwO5OJqksLa+NeD/VS
 GvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7NXg8Jqlawz9hTl7QVYtiAoW5g5gmJUEhCozASimjLY=;
 b=oCJ4L67cVTmAecqEqviMJ/ru/sgKQVon40tVIkgonpbn7ec47jgeEBFdT+jh2UUYAK
 GSeChT83jBQ4eIbU/B4foH/lImPXadMKSDgj350YTa/Z7AtAGLza1hqa9jVy+IwMSNPX
 tHNMFCCtoRjuL84FYaNDqKxp92z9p9A1keKBuTKPA18ynihq7eZUUekGoL3ca9sTMjsc
 VSA9XbrDufx/vqa8ZH2t1z1ZOUB0nnzmTWFfL539JidKC9ZnFAhMfkCXwn7AUZ6WnUGM
 A4IN9AqXE1doGENJ+Q3+WNZdeMHyAo5bSOOOvAcOURebDKBGgFejJM3lf1IKgdSFu6KM
 SO0A==
X-Gm-Message-State: AOAM530hoTFGESZIPN6jcP92bLitHsbEZJ+lmjTrInUUFQFLbtLb1SV4
 rEoHIz1tYPRE60AH1RbHSJsv4Q==
X-Google-Smtp-Source: ABdhPJyCaTwpsO+3BIbR/4CjHgTJrYpKiOxX/5T5mKFX890wnAJ2q5RqF2lSXasonmbtOYQEWce1fA==
X-Received: by 2002:a17:906:9402:: with SMTP id
 q2mr4040324ejx.106.1639777877819; 
 Fri, 17 Dec 2021 13:51:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j11sm3960288edv.0.2021.12.17.13.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:51:17 -0800 (PST)
Message-ID: <868512b1-d1b7-d553-0172-0b1cfc3cd347@mind.be>
Date: Fri, 17 Dec 2021 22:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-4-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212123753.11848-4-dariobin@libero.it>
Subject: Re: [Buildroot] [RESEND PATCH v2,
 3/4] configs/stm32f429_disco: fix kernel bootup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 13:37, Dario Binacchi wrote:
> The kernel generated by the configuration for the STM32f429-discovery
> board is buggy:
> 
> Fixes:
>   Unhandled exception: IPSR = 00000006 LR = fffffff1
>   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
>   Hardware name: STM32 (Device Tree Support)
>   task: 9041a000 task.stack: 907c0000
>   PC is at ret_fast_syscall+0x2/0x4a
>   LR is at tty_ioctl+0x1ad/0x75c
>   pc : [<0800d942>]    lr : [<080c2e05>]    psr: 4000000b
>   sp : 907c1fa8  ip : 0000001c  fp : 905961a2
>   r10: 00000000  r9 : 907c0000  r8 : 0800dae0
>   r7 : 00000036  r6 : 905e7e60  r5 : 00000000  r4 : 905e7ebc
>   r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
>   xPSR: 4000000b
>   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
>   Hardware name: STM32 (Device Tree Support)
>   [<0800fbf9>] (unwind_backtrace) from [<0800f05b>] (show_stack+0xb/0xc)
>   [<0800f05b>] (show_stack) from [<0800f553>] (__invalid_entry+0x4b/0x4c)
> 
> Inspired by commit a3e3d9c198 ("configs/stm32f469_disco_xip_defconfig:
> alternative defconfig for XIP") I updated the stm32f429_disco_defconfig
> configuration to use a newer kernel. Current setup kernel + rootfs fits
> in 1.6MB on-chip flash memory.
> 
> The kernel has been moved to new flash bank due to growth of dtb size.
> 
> For better binary size optimization gcc LTO is turned on.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../stm32f429-disco/flash.sh                  |   2 +-
>   .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
>   ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
>   configs/stm32f429_disco_defconfig             |  10 +-
>   4 files changed, 127 insertions(+), 37 deletions(-)
>   create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
>   delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> 
> diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
> index b19e0a6019..3e2bf121d3 100755
> --- a/board/stmicroelectronics/stm32f429-disco/flash.sh
> +++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
> @@ -21,6 +21,6 @@ ${OUTPUT_DIR}/host/bin/openocd -f board/${BOARD_NAME}.cfg \
>     -c "flash info 0" \
>     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429i-disco.bin 0x08000000" \
>     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429-disco.dtb 0x08004000" \
> -  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08008000" \
> +  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x0800C000" \
>     -c "reset run" \
>     -c "shutdown"
> diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
> new file mode 100644
> index 0000000000..7b5c60f180
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/linux.config
> @@ -0,0 +1,120 @@
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_XZ=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_LOG_BUF_SHIFT=12
> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=10
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
> +# CONFIG_RD_GZIP is not set
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_XZ is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +# CONFIG_RD_ZSTD is not set
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_MULTIUSER is not set
> +# CONFIG_SYSFS_SYSCALL is not set
> +# CONFIG_FHANDLE is not set
> +CONFIG_POSIX_TIMERS=y
> +CONFIG_BUG=y
> +# CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
> +# CONFIG_EPOLL is not set
> +# CONFIG_SIGNALFD is not set
> +# CONFIG_TIMERFD is not set
> +# CONFIG_EVENTFD is not set
> +# CONFIG_AIO is not set
> +# CONFIG_IO_URING is not set
> +# CONFIG_ADVISE_SYSCALLS is not set
> +# CONFIG_MEMBARRIER is not set
> +# CONFIG_KALLSYMS is not set
> +CONFIG_KCMP=y
> +# CONFIG_RSEQ is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=y
> +# CONFIG_SLAB_MERGE_DEFAULT is not set
> +# CONFIG_MMU is not set
> +CONFIG_ARCH_STM32=y
> +# CONFIG_MACH_STM32F469 is not set
> +# CONFIG_MACH_STM32F746 is not set
> +# CONFIG_MACH_STM32F769 is not set
> +# CONFIG_MACH_STM32H743 is not set
> +CONFIG_CPU_V7M_NUM_IRQ=240
> +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
> +CONFIG_SET_MEM_PARAM=y
> +CONFIG_DRAM_BASE=0x90000000
> +CONFIG_DRAM_SIZE=0x00800000
> +CONFIG_HZ_1000=y
> +# CONFIG_ATAGS is not set
> +CONFIG_XIP_KERNEL=y
> +CONFIG_XIP_PHYS_ADDR=0x0800C000
> +CONFIG_XIP_DEFLATED_DATA=y
> +# CONFIG_SUSPEND is not set
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_COMPAT_32BIT_TIME is not set
> +# CONFIG_GCC_PLUGINS is not set
> +# CONFIG_BLOCK is not set
> +CONFIG_BINFMT_FLAT=y
> +CONFIG_BINFMT_SHARED_FLAT=y
> +# CONFIG_COREDUMP is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +# CONFIG_FW_LOADER is not set
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_EEPROM_93CX6=y
> +# CONFIG_INPUT is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LDISC_AUTOLOAD is not set
> +CONFIG_SERIAL_STM32=y
> +CONFIG_SERIAL_STM32_CONSOLE=y
> +# CONFIG_DEVMEM is not set
> +# CONFIG_HWMON is not set
> +CONFIG_WATCHDOG=y
> +CONFIG_MFD_STM32_TIMERS=y
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_STM32=y
> +CONFIG_DMADEVICES=y
> +CONFIG_STM32_DMA=y
> +CONFIG_STM32_DMAMUX=y
> +CONFIG_STM32_MDMA=y
> +CONFIG_SYNC_FILE=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_IIO=y
> +CONFIG_IIO_BUFFER=y
> +CONFIG_IIO_TRIGGERED_BUFFER=y
> +CONFIG_IIO_STM32_TIMER_TRIGGER=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +# CONFIG_PROC_SYSCTL is not set
> +CONFIG_CONFIGFS_FS=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_NLS=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_CONSOLE_LOGLEVEL_QUIET=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +CONFIG_DEBUG_INFO=y
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +CONFIG_DEBUG_FS=y
> +# CONFIG_DEBUG_MISC is not set
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch b/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> deleted file mode 100644
> index d6d5c61aae..0000000000
> --- a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ded9afa688184b3240a92c2b8f114c545a09bc3f Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Sat, 12 Mar 2016 23:14:41 +0100
> -Subject: [PATCH] ARM: stm32f249-disco: don't force init= in /chosen/bootargs
> -
> -There is no reason to override the kernel's default init= value, as
> -this breaks userspace that assumes the kernel default of /init is
> -used. Since stm32 is often used with a minimal bootloader
> -(afboot-stm32) that doesn't provide any mechanism to override the DTB,
> -we need to adjust the kernel command line in the Device Tree source.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> -index f0b731d..2bae81c 100644
> ---- a/arch/arm/boot/dts/stm32f429-disco.dts
> -+++ b/arch/arm/boot/dts/stm32f429-disco.dts
> -@@ -53,7 +53,7 @@
> - 	compatible = "st,stm32f429i-disco", "st,stm32f429";
> -
> - 	chosen {
> --		bootargs = "root=/dev/ram rdinit=/linuxrc";
> -+		bootargs = "root=/dev/ram";
> - 		stdout-path = "serial0:115200n8";
> - 	};
> -
> ---
> -2.6.4
> -
> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
> index 4007eb20a5..01b54c02cc 100644
> --- a/configs/stm32f429_disco_defconfig
> +++ b/configs/stm32f429_disco_defconfig
> @@ -1,12 +1,14 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
> -BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +BR2_KERNEL_HEADERS_5_15=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_ENABLE_LTO=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
> -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
