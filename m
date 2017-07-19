From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 19:45:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] br toolchain: gcc4.x/5.x bugfix
	libsanitizer ppc
In-Reply-To: <1499976005-36459-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 13 Jul 2017 15:00:05 -0500")
References: <1499976005-36459-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87h8y8722i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Fixes a missing include of signal.h
 > Verified to break 4.9.4 / 5.4.0 when using
 > target_platform=powerpc-unknown-linux-gnu with glibc 2.25:

 > ../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
 > ../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
 >    return signum == SIGSEGV && common_flags()->handle_segv;

 > Resolves Bug: https://bugs.busybox.net/show_bug.cgi?id=10061

 > Upstream: https://patchwork.ozlabs.org/patch/725596/

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
