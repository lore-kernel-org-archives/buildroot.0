From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 00:13:23 +0200
Subject: [Buildroot] [git commit] uclibc: convert to the package
	infrastructure
Message-ID: <20130704095651.6A6399A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5e92d92e7ee413157aae7cecf1f354e718731e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: update manual to match]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/customize-uclibc-config.txt            |    4 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk   |    2 +-
 ...__libc_epoll_pwait-compile-failure-on-x86.patch |    0
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |    0
 .../0.9.32.1/uclibc-linuxthreads-errno-fix.patch   |    0
 .../uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch   |    0
 .../uclibc/0.9.32.1/uclibc-unshare.patch           |    0
 .../uclibc-OpenWRT-140-avr32_atomic_fix.patch      |    0
 .../uclibc-bits-time.h-sync-with-glibc-2.16.patch  |    0
 .../0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch  |    0
 .../uclibc/0.9.33.2/uclibc-dup3.patch              |    0
 package/uclibc/Config.in                           |  166 ++++++
 .../uClibc => package/uclibc}/uClibc-0.9.32.config |    0
 .../uClibc => package/uclibc}/uClibc-0.9.33.config |    0
 .../uclibc}/uClibc-snapshot.config                 |    0
 package/uclibc/uclibc.mk                           |  484 ++++++++++++++++
 toolchain/toolchain-buildroot.mk                   |    4 -
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/uClibc/Config.in                         |   97 ---
 toolchain/uClibc/uclibc.mk                         |  610 --------------------
 23 files changed, 655 insertions(+), 718 deletions(-)

Patch is too large, so refusing to show it
