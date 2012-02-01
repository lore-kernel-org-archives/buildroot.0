From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2012 09:12:57 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <87pqdzijxv.fsf@macbook.be.48ers.dk>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
 <87pqdzijxv.fsf@macbook.be.48ers.dk>
Message-ID: <20120201091257.636dc684@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jan 2012 23:30:36 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> ---
>  Thomas>  linux/linux.mk |    3 ++-
>  Thomas>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
>  Thomas> diff --git a/linux/linux.mk b/linux/linux.mk
>  Thomas> index 5c5a1d2..dbe1ad7 100644
>  Thomas> --- a/linux/linux.mk
>  Thomas> +++ b/linux/linux.mk
>  Thomas> @@ -40,7 +40,8 @@ LINUX_MAKE_FLAGS = \
>  Thomas>  	ARCH=$(KERNEL_ARCH) \
>  Thomas>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
>  Thomas>  	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
>  Thomas> -	LZMA="$(LZMA)"
>  Thomas> +	LZMA="$(LZMA)" \
>  Thomas> +	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
> 
> Committed, thanks. Not released to this patch, but is the LZMA stuff
> still used/needed?

It has been added by
http://git.buildroot.net/buildroot/commit/target/linux/Makefile.in?id=ea8b1fa6a60705eedc5bd4f405f45c8f531c2126,
which is a bit limited in details on why it was needed. I guess the
goal was to tell the Linux build process to use the lzma utility built
for the host by Buildroot, in case the Linux kernel is built (or the
initramfs) with LZMA compression. But that remains to be verified.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
