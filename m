From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Nov 2009 08:41:58 +0100
Subject: [Buildroot] Advice needed on package/customize
In-Reply-To: <2df568dc0911111623q6581f6d2ye2ef6416e79acd81@mail.gmail.com>
References: <2df568dc0911111623q6581f6d2ye2ef6416e79acd81@mail.gmail.com>
Message-ID: <20091112084158.09e4537f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Nov 2009 17:23:46 -0700,
Gordon Smith <spider.karma+busybox.net@gmail.com> a ?crit :

> A simple case:
> 
> In .config:
>     BR2_PACKAGE_CUSTOMIZE=y
> 
> In package/customize/source:
>     $ ls -lA package/customize/source
>     total 4
>     -rw-r--r-- 1 gsmith gsmith 0 2009-09-01 02:44 .empty
>     -rw-r--r-- 1 gsmith gsmith 7 2009-11-11 16:57 hello.txt
> 
> After "make", there is no hello.txt in the kernel image or in
> rootfs.i686.initramfs_list.

After changing the contents of package/customize/source, did you make a
full rebuild (i.e clean everything and restart the build) ?

If not, then the stamp file $(BUILD_DIR)/.customize already existed, so
the contents of package/customize/source are not copied to the target
directory. If you want to force the reinstallation of customized files
without rebuilding everything, then do 'make customize-clean' and
restart make.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
