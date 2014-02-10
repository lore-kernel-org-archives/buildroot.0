From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Feb 2014 12:16:13 +0100
Subject: [Buildroot] [PATCH v7 1/4] eudev: new package.
In-Reply-To: <0104e701-c831-4366-8ae7-0c993afe377a@email.android.com>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-2-git-send-email-eric.le.bihan.dev@free.fr>
 <0104e701-c831-4366-8ae7-0c993afe377a@email.android.com>
Message-ID: <20140210111612.GA22843@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Fri, Feb 07, 2014 at 08:14:54PM +0100, Thomas De Schampheleire wrote:
> >diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> >new file mode 100644
> >index 0000000..94d94e0
> >--- /dev/null
> >+++ b/package/eudev/Config.in
> >@@ -0,0 +1,37 @@
> >+config BR2_PACKAGE_EUDEV
> >+	bool "eudev"
> >+	depends on !BR2_avr32 # no epoll_create1
> >+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> >+	depends on BR2_LARGEFILE # util-linux
> >+	depends on BR2_USE_WCHAR # util-linux
> >+	depends on !BR2_PREFER_STATIC_LIB # kmod
> >+	select BR2_PACKAGE_UTIL_LINUX
> >+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >+	select BR2_PACKAGE_KMOD
> >+	help
> >+	  Userspace device daemon. This is a standalone version,
> >+	  independent of systemd. It is a fork maintained by Gentoo.
> >+
> >+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
> >+	  and inotify.
> >+
> >+	  http://github.com/gentoo/eudev/

>
> I don't see the mmu option on the main symbol, so either that or the comment dependencies are not correct..
I forgot to add 'depends on BR2_USE_MMU # fork()'. I will fix this.

Best regards,
ELB
