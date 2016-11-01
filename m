From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:22:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: Remove runtime library
 paths
In-Reply-To: <20161030094226.32070-1-bernd.kuhls@t-online.de>
References: <20161030094226.32070-1-bernd.kuhls@t-online.de>
Message-ID: <20161101162238.7fd4264b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 10:42:26 +0100, Bernd Kuhls wrote:
> This patch re-adds the rebased version of python-2.7-011-no-rpath.patch
> which was removed with the 2.7.6 bump:
> https://git.busybox.net/buildroot/commit/package/python?id=7e960dc9da56d4a484b5480746aaf617ca491274
> 
> Without this patch usr/lib/python2.7/lib-dynload/_bsddb.so contains
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_bsddb.so | grep RPATH
>  0x0000000f (RPATH)                      Library rpath: [/home/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib]
> 
> With this patch:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_bsddb.so | grep RPATH
> $

I think the idea for rpath pollution is to have a global solution with
patchelf to remove bogus rpath from all target binaries. Samuel Martin
is working on this, maybe you can help?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
