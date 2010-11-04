From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Nov 2010 17:16:59 +0100
Subject: [Buildroot] [PATCH] Repair initramfs dependancies after move to
 fs
In-Reply-To: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
References: <1271687689-344-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20101104171659.3aaa4f94@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Will,

I'm replying on this old patch that I acked back in April. But I now
have one question. While I still agree on the changes on
target/linux/Makefile* (now linux/linux.mk), I don't understand why the
following change was needed:

> diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
> index 4a205d1..9aaf1b0 100644
> --- a/fs/initramfs/initramfs.mk
> +++ b/fs/initramfs/initramfs.mk
> @@ -6,6 +6,12 @@
>  #
>  #############################################################
>  
> +ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
> +INITRAMFS_TARGET:=initramfs-root
> +else
> +INITRAMFS_TARGET:= #nothing
> +endif

the INITRAMFS_TARGET variable isn't used anywhere in the current git.
Isn't this code useless ? (I think it is, but I'd like to be sure).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
