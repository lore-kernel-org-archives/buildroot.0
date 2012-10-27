From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 27 Oct 2012 21:22:09 +0200
Subject: [Buildroot] [PATCH 1/1] binutils version 2.23 is only available is
	.gz format
Message-ID: <1351365729-17914-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


binutils version 2.23 is only available in .gz format, the older versions are in .bz2 format.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/binutils/binutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d41cac4..e1aac9b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -16,7 +16,12 @@ BINUTILS_VERSION = 2.21
 endif
 endif
 
+ifeq ($(BINUTILS_VERSION),2.23)
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+else
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
+endif
+
 BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
-- 
1.8.0
