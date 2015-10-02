From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Oct 2015 17:30:38 +0000
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.4.0
In-Reply-To: <1443804738-13762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443804738-13762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DBE61@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^PCIUTILS_VERSION package/pciutils/pciutils.mk 
PCIUTILS_VERSION = 3.4.0

$ file output/target/usr/bin/lspci 
output/target/usr/bin/lspci: ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 2.6.32, stripped

Regards,

Vincent.

________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Gustavo Zacarias [gustavo at zacarias.com.ar]
Sent: 02 October 2015 17:52
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.4.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index cc901d1..cda0ac2 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256 514a3bdb77e4cdbe9e970e1885af46e0ba2011bf97364368c455ade0edd4e3a9        pciutils-3.3.1.tar.xz
+sha256 f8898ff6d58f52e9e17e2763bff479bb9511bcf0d8711084fa77f1b6b1739196        pciutils-3.4.0.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 12c13b2..6c0e660 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-PCIUTILS_VERSION = 3.3.1
+PCIUTILS_VERSION = 3.4.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
--
2.4.9

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
