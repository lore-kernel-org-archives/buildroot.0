From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 17:09:26 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper: use
 -ffp-contract=off on MIPS Xburst for gcc >= 4.6
In-Reply-To: <20180401142335.80FCF8296B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 1 Apr 2018 16:23:33 +0200")
References: <20180401142335.80FCF8296B@busybox.osuosl.org>
Message-ID: <87zi2dbuqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5e58509bfe497c5e85db58f8213b0a44ac79dd3f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since gcc 4.6, GCC deprecated -mfused-madd, -ffp-contract=off should
 > be used for the Xburst workaround.

 > Tested with the MIPS Sourcery 2011.03 toolchain (based on gcc 4.5),
 > the toolchain wrapper uses -mno-fused-madd, as expected:

 > $ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
 > Toolchain wrapper executing:
 >     '/home/thomas/toolchains/mips-2011.03/bin/mips-linux-gnu-gcc'
 >     '--sysroot'
 >     '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
 >     '-mabi=32'
 >     '-msoft-float'
 >     '-mno-fused-madd'
 >     '-EL'
 >     '-march=mips32r2'
 >     '-o'
 >     'toto'
 >     'toto.c'

 > And with the MIPS Sourcery 2012.09 toolchain (based on gcc 4.7), the
 > toolchain wrapper uses -ffp-contract=off, as expected:

 > $ BR2_DEBUG_WRAPPER=2 ./output/host/bin/mips-linux-gnu-gcc -o toto toto.c
 > Toolchain wrapper executing:
 >     '/home/thomas/toolchains/mips-2012.09/bin/mips-linux-gnu-gcc'
 >     '--sysroot'
 >     '/home/thomas/projets/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot'
 >     '-mabi=32'
 >     '-msoft-float'
 >     '-ffp-contract=off'
 >     '-EL'
 >     '-march=mips32r2'
 >     '-o'
 >     'toto'
 >     'toto.c'

 > Fixes the ci20_defconfig build:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/60303132

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > [Thomas: rework to continue supporting pre-gcc-4.6 toolchains, extend
 > the commit log after doing more testing.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
