From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:43:28 +0100
Subject: [Buildroot] [PATCH 1/2 v2] toolchain/external: copy libssp.so
 if SSP is enabled
In-Reply-To: <e91e5a4b48411f99fe096f5b3f4714ed1481c9cf.1572010936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 25 Oct 2019 15:42:41 +0200")
References: <cover.1572010936.git.yann.morin.1998@free.fr>
 <e91e5a4b48411f99fe096f5b3f4714ed1481c9cf.1572010936.git.yann.morin.1998@free.fr>
Message-ID: <87y2x2z9n3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Yann Droneaud <ydroneaud@opteya.com>
 > In Buildroot, the internal toolchain backend uses the SSP support from
 > the C library, not that of gcc.

 > Some external toolchains come with SSP suport in gcc, which is
 > implemented in libssp.so, rather than in the C library.

 > When a toolchain even has both, it is up to the compiler to decide
 > whether it will link to libssp or use the support from the C library.

 > However, in the latter case, a (incorrectly written) package may decide
 > to explicitly link with libssp.so when it is available (even though the
 > compiler may have decided otherwise if left by itself). This is the case
 > for example with sox, which results in runtime failures, such as:

 >     $ sox
 >     sox: error while loading shared libraries: libssp.so.0: cannot open
 >     shared object file: No such file or directory

 > Even if sox is wrong in doing so, the case for libssp-only toolchains is
 > still valid, and we must copy it as we copy other libs.

 > Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - enhance the commit log  (Yann, the other one)

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
