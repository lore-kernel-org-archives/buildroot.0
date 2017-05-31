From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 10:58:51 +0200
Subject: [Buildroot] Cherry-pick 2530fe810ee7ece8da30e246af522e2e0be8e83f in
	2017.02.x
Message-ID: <20170531105851.0e4d6b37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

I think you could cherry-pick commit
2530fe810ee7ece8da30e246af522e2e0be8e83f into the 2017.02.x branch. It
fixes a build failure of gdb with uclibc/musl caused by
rpl_gettimeofday().

I.e, on 2017.02.2, the following defconfig fails to build gdb:

BR2_aarch64=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_PACKAGE_GDB=y

With this commit cherry-picked, it builds fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
