From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 23:19:16 +0100
Subject: [Buildroot] [PATCH 1/3] binutils: remove dead code
Message-ID: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer have any way of using version 2.23, and all the other
versions that we support are available as .tar.bz2. Therefore we can
remove the special case related to the 2.23 version only being
available as a .tar.gz archive.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f40c45f..ab9f167 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -16,10 +16,6 @@ BINUTILS_VERSION = 2.21
 endif
 endif
 
-ifeq ($(BINUTILS_VERSION),2.23)
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-endif
-
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
-- 
2.0.0
