From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:36:21 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.20
In-Reply-To: <20161204112026.GA30258@waldemar-brodkorb.de>
References: <20161204112026.GA30258@waldemar-brodkorb.de>
Message-ID: <20161204153621.5d66d8a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Dec 2016 12:20:27 +0100, Waldemar Brodkorb wrote:
> The test suite is removed from the package and is already a separate
> package in buildroot. All patches are upstream, so remove them.
> The UCLIBC_HAS_LFS option is removed upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-linuxthreads-add-back-signal.h.patch      | 28 ---------
>  ...ne-madvise-related-macros-for-noMMU-targe.patch | 66 ----------------------
>  ...003-posix_madvise-not-available-for-noMMU.patch | 30 ----------
>  package/uclibc/uclibc.hash                         |  2 +-
>  package/uclibc/uclibc.mk                           | 30 +---------
>  5 files changed, 2 insertions(+), 154 deletions(-)
>  delete mode 100644 package/uclibc/0001-linuxthreads-add-back-signal.h.patch
>  delete mode 100644 package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch
>  delete mode 100644 package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch

You forgot to remove the BR2_UCLIBC_INSTALL_TEST_SUITE from the
Config.in. So I've done that, and added the necessary logic in
Config.in.legacy.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
