From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:23:51 +0100
Subject: [Buildroot] [PATCH] board/qemu/ppc-mpc8544ds: apply Debian
 patch fixing wrong mcpu
In-Reply-To: <20201108171500.3655310-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 8 Nov 2020 18:15:00 +0100")
References: <20201108171500.3655310-1-romain.naour@gmail.com>
Message-ID: <87ft5iqnxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When building the linux kernel for PPC_85xx cpus with GCC 8, the build fail with:
 >   powerpc-e500v2-linux-gnuspe-gcc: error: unrecognized argument in option '-mcpu=powerpc'
 >   powerpc-e500v2-linux-gnuspe-gcc: note: valid arguments to '-mcpu=' are: 8540 8548 native

 > "GCC started treating "PowerPC" and "PowerPC SPE" as two different architectures and
 > that's the reason for the reduced -mcpu list." [1]

 > As suggested in the crosstool-ng issue [1], apply the Debian patch to avoid
 > -mcpu=powerpc or -mcpu=powerpc64.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981654

 > [1] https://github.com/crosstool-ng/crosstool-ng/issues/1152
 > [2] https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
