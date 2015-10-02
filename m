From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Oct 2015 17:32:24 +0000
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 1.6.8
In-Reply-To: <1443804757-13808-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443804757-13808-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DBE7A@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libcryptsetup.so.4.7.0 
output/target/usr/lib/libcryptsetup.so.4.7.0: ELF 32-bit MSB shared object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, stripped

$ grep ^CRYPTSETUP_VERSION package/cryptsetup/cryptsetup.mk 
CRYPTSETUP_VERSION_MAJOR = 1.6
CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8

Regards,

Vincent.

________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Gustavo Zacarias [gustavo at zacarias.com.ar]
Sent: 02 October 2015 17:52
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH] cryptsetup: bump to version 1.6.8

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index a418081..a0b975d 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
-sha256 c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820        cryptsetup-1.6.7.tar.xz
+sha256 45a6ccd3c65b7d904e58e1cb3656a7e997190b6a05b5ff7c6887e4a41c5f19bc        cryptsetup-1.6.8.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 3655d5d..78cbe8f 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################

 CRYPTSETUP_VERSION_MAJOR = 1.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
--
2.4.9

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
