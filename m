From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 17:35:25 +0100
Subject: [Buildroot] [PATCH 2/3] qemu: needs zlib
In-Reply-To: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352046926-10804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1352046926-10804-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build error message is:
  Error: zlib check failed
  Make sure to have the zlib libs and headers installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c2c4103..67d5ab2 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -8,7 +8,7 @@ QEMU_VERSION = 1.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 
-QEMU_DEPENDENCIES = host-pkgconf
+QEMU_DEPENDENCIES = host-pkgconf zlib
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
1.7.9.5
