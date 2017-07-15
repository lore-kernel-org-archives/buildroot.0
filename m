From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:36:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] br toolchain: gcc4.x/5.x bugfix
 libsanitizer ppc
In-Reply-To: <1499976005-36459-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1499976005-36459-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170715113631.2d71bb27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 15:00:05 -0500, Matt Weber wrote:
> Fixes a missing include of signal.h
> 
> Verified to break 4.9.4 / 5.4.0 when using
> target_platform=powerpc-unknown-linux-gnu with glibc 2.25:
> 
> ../../../../gcc-host/libsanitizer/asan/asan_linux.cc: In function 'bool __asan::AsanInterceptsSignal(int)':
> ../../../../gcc-host/libsanitizer/asan/asan_linux.cc:222:20: error: 'SIGSEGV' was not declared in this scope
>    return signum == SIGSEGV && common_flags()->handle_segv;
> 
> Resolves Bug: https://bugs.busybox.net/show_bug.cgi?id=10061
> 
> Upstream: https://patchwork.ozlabs.org/patch/725596/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---

Applied to master after tweaking the commit log and the formatting of
the patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
