From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 22 Jan 2017 22:12:00 +0100
Subject: [Buildroot] [PATCH] package/wavemon: bump to version 0.8.1
Message-ID: <20170122211200.19911-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to fetch the musl patch from upstream anymore.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wavemon/wavemon.hash | 3 +--
 package/wavemon/wavemon.mk   | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index e35f6ace6..69bd2b4bf 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  81ee1f06f8349fee62e98ec5b53dff5b76c4d8fcb439f20cca806255239e3a2a  wavemon-v0.8.0.tar.gz
-sha256  681b86ef1469df8f7091040258dd01169bea2a7df294185c35bc867725deab2f  01e987a032b81af7bbeba1c439759d750dc1f398.patch
+sha256  c9ea57da4f8161401bcaaca17b37bcdf16ffb88baad2370afed2e15a7f71af73  wavemon-v0.8.1.tar.gz
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 746d45f33..5a1b7ee0d 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = v0.8.0
+WAVEMON_VERSION = v0.8.1
 WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPLv3+
 WAVEMON_LICENSE_FILES = COPYING
 WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 
-# Fix musl build issue
-WAVEMON_PATCH = https://github.com/uoaerg/wavemon/commit/01e987a032b81af7bbeba1c439759d750dc1f398.patch
-
 # Handwritten Makefile.in, automake isn't used
 WAVEMON_MAKE_OPTS = CC="$(TARGET_CC)"
 
-- 
2.11.0
