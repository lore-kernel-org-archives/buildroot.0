From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:37:27 +0200
Subject: [Buildroot] [PATCH 1/3] package/gcc: disable libcilkrts when
 there is no thread support
In-Reply-To: <20181021115415.21471-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 21 Oct 2018 13:54:13 +0200")
References: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
 <20181021115415.21471-2-thomas.petazzoni@bootlin.com>
Message-ID: <87pnvz8qrc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The libcilkrts configure script errors out with "Pthreads are required
 > to build libcilkrts" if the C library doesn't have thread support. To
 > fix that, we disable libcilkrts when thread support is not available.

 > This issue was not noticed until now, because we only regularly build
 > a no-thread toolchain for ARM, and libcilkrts was enabled on ARM only
 > starting in gcc 7.x.

 > This fixes the build of no-thread toolchains on architectures where
 > libcilkrts is supported, i.e x86/x86-64, ARM and Sparc.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
