From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Oct 2020 09:36:13 +0100
Subject: [Buildroot] [PATCH] gcc: disable fortran use of libquadmath
In-Reply-To: <20200911124131.8549-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Fri, 11 Sep 2020 07:41:31 -0500")
References: <20200911124131.8549-1-matthew.weber@rockwellcollins.com>
Message-ID: <87361wf6v6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The GCC package has a default conf option of disabling libquadmath and
 > the toolchain dependencies selectively enabled it if i386 / x64.

 > Fixes:
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622

 > This patch fixes a build failure when (GCC + glibc) is being built for
 > the IBM Power8 arch and has libgfortran enabled + libquadmath disabled.
 > The libgfortran has a code condition for __float128 and includes the
 > quadmath headers. The bug occurs because Power8 has emulated
 > float128 support. The fix per GCC options is to also set
 > --disable-libquadmath-support which disables the
 > __float128/libquadmath support in gcc/fortran and in libgfortran [1].

 > Another option to fix the build failure was to enable libquadmath for
 > IBM Power8 (ISA 2.07), however this would be soft float based as the
 > ISA 3.0+ (Power9) first supports native float128 [2][3].

 > [1] https://fortran.gcc.gnu.narkive.com/8uSfoKUS/patch-build-pr-46540-add-disable-libquadmath-disable-libquadmath-support
 > [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66382#c7
 > [3] https://gcc.gnu.org/onlinedocs/gcc/RS_002f6000-and-PowerPC-Options.html

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
