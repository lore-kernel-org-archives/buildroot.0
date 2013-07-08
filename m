From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jul 2013 14:57:08 +0200
Subject: [Buildroot] [PATCH] linux: Do not force GZIP initramfs
	compression
In-Reply-To: <1349825696-28535-1-git-send-email-gvaxon@gmail.com> (Valentine
 Barshak's message of "Wed, 10 Oct 2012 03:34:56 +0400")
References: <1349825696-28535-1-git-send-email-gvaxon@gmail.com>
Message-ID: <878v1hfbvf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentine" == Valentine Barshak <gvaxon@gmail.com> writes:

 Valentine> Initramfs compression does not make much sense for the architectures
 Valentine> that support compressed kernel images because in this case the data
 Valentine> would be compressed twice. This will eventually result in a bigger
 Valentine> kernel image and time overhead when uncompressing it.
 Valentine> The only reason to use compressed initramfs is to reduce memory
 Valentine> usage when the kernel prepares rootfs, and both the unpacked
 Valentine> filesystem and initramfs.cpio are present in the memory.

 Valentine> Buildroot attempts to force GZIP compression for initramfs,
 Valentine> however it doesn't always work because initramfs compression mode
 Valentine> depends on RAM disk compression supported by the kernel.
 Valentine> Thus, CONFIG_INITRAMFS_COMPRESSION_GZIP depends on CONFIG_RD_GZIP.
 Valentine> If CONFIG_RD_GZIP is not set, setting GZIP initramfs compression
 Valentine> will have no effect.

 Valentine> Besides, the kernel also supports other compression methods,
 Valentine> like BZIP2, LZMA, XZ and LZO. Forcing the good old GZIP does not
 Valentine> really make much sense any more.

 Valentine> This removes initramfs compression settings from Buildroot,
 Valentine> so that the default value preset in the kernel config is used,
 Valentine> which is CONFIG_INITRAMFS_COMPRESSION_NONE.

 Valentine> If initramfs compression is still needed, it can be set
 Valentine> in the kernel config (using make linux-menuconfig)

Sorry, this somehow seems to have fallen through the cracks - Committed,
thanks.

-- 
Bye, Peter Korsgaard
