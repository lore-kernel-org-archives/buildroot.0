From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  9 Aug 2017 08:02:02 +0300
Subject: [Buildroot] [PATCH] faad2: security bump to version 2.8.1
Message-ID: <108fe39722b22a67f7737d6e174dc8483c784b95.1502254922.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: CVE-2017-9218, CVE-2017-9219, CVE-2017-9220, CVE-2017-9221,
CVE-2017-9222, CVE-2017-9223, CVE-2017-9253, CVE-2017-9254,
CVE-2017-9255, CVE-2017-9256, CVE-2017-9257

http://seclists.org/fulldisclosure/2017/Jun/32

Switch to .tar.bz2 to save some bandwidth.

Add autoreconf since unfortunately upstream tarball does not ship the
configure script.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/faad2/faad2.hash | 6 +++---
 package/faad2/faad2.mk   | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index 691645b7c07e..d298e909a97c 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.7/ (used by upstream):
-sha1	80eaaa5cc576c35dd28863767b795c50cbcc0511  faad2-2.7.tar.gz
+# From http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.8.0/ (used by upstream):
+sha1	a5caa71cd915acd502d96cba56f38296277f2350  faad2-2.8.1.tar.bz2
 # Locally computed
-sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  faad2-2.7.tar.gz
+sha256  f4042496f6b0a60f5ded6acd11093230044ef8a2fd965360c1bbd5b58780933d  faad2-2.8.1.tar.bz2
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index d7b55d3efaef..fa965fe5909c 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.7
-FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION)
+FAAD2_VERSION_MAJOR = 2.8
+FAAD2_VERSION = $(FAAD2_VERSION_MAJOR).1
+FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION_MAJOR).0
+FAAD2_SOURCE = faad2-$(FAAD2_VERSION).tar.bz2
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
+# No configure script in upstream tarball
+FAAD2_AUTORECONF = YES
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-- 
2.13.2
