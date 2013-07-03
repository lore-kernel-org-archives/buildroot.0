From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:48:45 +0200
Subject: [Buildroot] [PATCH 15/23] uclibc: convert to the package
	infrastructure
In-Reply-To: <1372620553-11416-16-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:05 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvvvnwle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gcc/gcc-intermediate/gcc-intermediate.mk   |   2 +-
 Thomas>  ...__libc_epoll_pwait-compile-failure-on-x86.patch |   0
 Thomas>  ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   0
 Thomas>  .../0.9.32.1/uclibc-linuxthreads-errno-fix.patch   |   0
 Thomas>  .../uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch   |   0
 Thomas>  .../uclibc/0.9.32.1/uclibc-unshare.patch           |   0
 Thomas>  .../uclibc-OpenWRT-140-avr32_atomic_fix.patch      |   0
 Thomas>  .../uclibc-bits-time.h-sync-with-glibc-2.16.patch  |   0
 Thomas>  .../0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch  |   0
 Thomas>  .../uclibc/0.9.33.2/uclibc-dup3.patch              |   0
 Thomas>  package/uclibc/Config.in                           | 166 ++++++
 Thomas>  .../uClibc => package/uclibc}/uClibc-0.9.32.config |   0
 Thomas>  .../uClibc => package/uclibc}/uClibc-0.9.33.config |   0
 Thomas>  .../uclibc}/uClibc-snapshot.config                 |   0
 Thomas>  package/uclibc/uclibc.mk                           | 484 ++++++++++++++++
 Thomas>  toolchain/toolchain-buildroot.mk                   |   4 -
 Thomas>  toolchain/toolchain-buildroot/Config.in            |   2 +-
 Thomas>  toolchain/toolchain-crosstool-ng.mk                |   1 -
 Thomas>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   2 +-
 Thomas>  toolchain/toolchain-external.mk                    |   1 -
 Thomas>  toolchain/uClibc/Config.in                         |  97 ----
 Thomas>  toolchain/uClibc/uclibc.mk                         |

You forgot to update docs/manual/customize-uclibc-config.txt. Committed
with that fixed, thanks.

-- 
Bye, Peter Korsgaard
