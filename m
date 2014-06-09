From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:34:38 +0200
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
In-Reply-To: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20140609153438.0de69bcb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Mon, 26 May 2014 18:01:37 -0300, Guido Mart?nez wrote:
> This patch allows building the kernel with an external initramfs. This
> is useful in cases where one wants to generate the kernel and rootfs
> with BR, and the kernel needs to contain an initramfs different to the
> rootfs.
> 
> The path specified can be a cpio archive or a directory, just like
> the kernel config. The path is specified w.r.t. BRs topdir, and made
> absolute since the kernel builds in another directory.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Since I agree with the feedback from Arnout, I'll mark this as Rejected
in patchwork. There's no point in duplicating each and every kernel
configuration option at the Buildroot level. Just make sure to tune
your kernel configuration properly, and pass it to Buildroot as the
kernel configuration file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
