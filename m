From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:24:34 +0200
Subject: [Buildroot] [PATCH 0/4] Solving the musl dynamic linker issues
In-Reply-To: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170705122434.41897a0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 15:41:03 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (4):
>   support/testing: add tests for musl and uclibc toolchains
>   toolchain/helpers.mk: re-evaluate DESTDIR in copy_toolchain_lib_root
>   toolchain-external: copy ld*.so* for all C libraries
>   toolchain-external: also put libgcc_s.so unconditionally in
>     TOOLCHAIN_EXTERNAL_LIBS

I've applied the series, and I've added a 5th patch that removes the
ld*.so handling in copy_toolchain_sysroot, keeping only ld*.so.* to be
consistent with what TOOLCHAIN_EXTERNAL_LIBS says. This (hopefully)
addresses Thomas DS comment :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
