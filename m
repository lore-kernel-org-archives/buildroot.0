From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:47:28 +0100
Subject: [Buildroot] [PATCH v1] valgrind: bump version to 3.11.0
In-Reply-To: <1446293156-1583-1-git-send-email-ps.report@gmx.net>
References: <1446293156-1583-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151031154728.00a37bcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 31 Oct 2015 13:05:56 +0100, Peter Seiderer wrote:
> - rebase patch 0001-workaround-SIGSEGV-on-PPC.patch
> - remove upstream applied patches
>   0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch
>   0004-configure.ac-Generalize-glibc-version-check.patch
> - rebase 0003-add-missing-ptrace-getsiginfo-on-powerpc.patch
>   (convert to git patch format, rename to
>   0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch)
> - remove legacy VALGRIND_AUTORECONF=YES (no more patch touching confgure.ac)
> - add '--disable-ubsan' for new undefined behaviour sanitiser option
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../valgrind/0001-workaround-SIGSEGV-on-PPC.patch  |  10 +-
>  ...E_GETSIGINFO-on-PowerPC-when-not-availab.patch} |  23 ++-
>  ...02-Fix-configure-for-Linux-kernel-4.0-rc1.patch |  48 -----
>  ...nfigure.ac-Generalize-glibc-version-check.patch | 228 ---------------------
>  package/valgrind/valgrind.hash                     |   2 +-
>  package/valgrind/valgrind.mk                       |   5 +-
>  6 files changed, 24 insertions(+), 292 deletions(-)
>  rename package/valgrind/{0003-add-missing-ptrace-getsiginfo-on-powerpc.patch => 0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch} (52%)
>  delete mode 100644 package/valgrind/0002-Fix-configure-for-Linux-kernel-4.0-rc1.patch
>  delete mode 100644 package/valgrind/0004-configure.ac-Generalize-glibc-version-check.patch

Applied, thanks. Could you have a look at the build failures that occur
with musl ? See
http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837/build-end.log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
