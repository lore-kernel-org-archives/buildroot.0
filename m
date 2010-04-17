From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 02:14:06 +0200
Subject: [Buildroot] [git commit master] initramfs: trivial fix
 following move to fs
In-Reply-To: <20100415115253.9C4B220CC8@busybox.osuosl.org>
References: <20100415115253.9C4B220CC8@busybox.osuosl.org>
Message-ID: <20100417021406.20816aed@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Apr 2010 13:51:33 +0200
Will Wagner <will_wagner@carallon.com> wrote:

>  define ROOTFS_INITRAMFS_CMD
> -	$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
> +	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
>  endef

Thanks Will and Peter for fixing the issues encountered following the
filesystem rework. I apologize for having let these issues go through
my testing without being noticed (I think I made most of my testing
*before* moving everything from target/ to fs/).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
