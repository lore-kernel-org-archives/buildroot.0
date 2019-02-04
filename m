From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 21:57:45 +0100
Subject: [Buildroot] [PATCH v7 8/8] libopenssl: bump version to 1.1.1a
In-Reply-To: <20190129093919.22060-8-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Tue, 29 Jan 2019 10:39:19 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-8-patrick.havelange@essensium.com>
Message-ID: <87womfqnjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > From: Peter Seiderer <ps.report@gmx.net>
 > - use BR2_TOOLCHAIN_HAS_UCONTEXT
 >     This is used to set -DOPENSSL_NO_ASYNC if needed.

 > - apply the CFLAGS correctly when compiling with -Os (bugfix).

 > - use -latomic when needed
 >     This fixes the build for br-sparc-uclibc-2018.05

 > - don't use madvise() if no MMU
 >     Trying to do so results in undefined reference to madvise() as
 >     it is not available on uclibc without MMU.
 >     The original openssl code checks if a macro used in the madvise call
 >     is defined. The problem comes from the fact that the code in
 >     crypto/mem_sec.c also includes a kernel header defining the same macro
 >     unconditionally. Thus the check is always true in that case.
 >     Upstream: https://github.com/openssl/openssl/pull/8089

 > - don't compile test/fuzzers
 >     These binaries introduced with 1.1.x sometimes do not compile.
 >     This is the case with the br-arm-cortex-m4-full toolchain

 > - don't build ocsp daemon if no MMU.
 >     Patch from  Richard Levitte.

 > - correctly enable cryptodev engine
 >     Thanks to Arnout Vandecappelle for spotting this.

 > - remove all parallel build patches (openssl build-system changed)

 > - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
 >   to apply to Configurations/unix-Makefile.tmpl (Makefile template)

 > - removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
 >   (upstream applied)

 > - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch to
 >   apply to crypto/build.info (Makefile template)

 > - fix musl/uclibc build failure, use '-DOPENSSL_NO_ASYNC'

 > - remove legacy enable-tlsext configure option

 > - remove target/host libdir configure options, fixes openssl.pc installation
 >   path, fixes wget compile

 > - change legacy INSTALL_PREFIX to DESTDIR

 > - remove 'libraries gets installed read only, so strip fails'
 >   workaround (not needed anymore)

 > - change engine directory from /usr/lib/engines to
 >   /usr/lib/engines-1.1

 > - change license file hash, no license change, only the following
 >   hint was removed:

 >     Actually both licenses are BSD-style Open Source licenses.
 >     In case of any license issues related to OpenSSL please
 >     contact openssl-core at openssl.org.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > Tested-by: Ryan Coe <bluemrp9@gmail.com>
 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

 > ---
 > Changes v6 -> v7:
 >   - none

Committed, thanks all!

-- 
Bye, Peter Korsgaard
