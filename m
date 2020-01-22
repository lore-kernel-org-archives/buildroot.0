From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 20:11:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libjpeg: security bump to version 9d
Message-ID: <20200122191130.55384-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2018-11813: libjpeg 9c has a large loop because read_pixel in
  rdtarga.c mishandles EOF.
- Update hash of README (small updates such as authors, year ...)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 7d47f550cb..4f0a677d04 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256	650250979303a649e21f87b5ccd02672af1ea6954b911342ea491f351ceb7122	jpegsrc.v9c.tar.gz
-sha256	31f366acfb6259456d9046eb7f16875e387f8bf029d37ac4c4397bf63f22fd6b	README
+sha256	99cb50e48a4556bc571dadd27931955ff458aae32f68c4d9c39d624693f69c32	jpegsrc.v9d.tar.gz
+sha256	3dc4e4a145c907a96bd6a0e40be3f722fecf061951909143cdff5365cba9c78c	README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index ab09881fc1..b855344f3c 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9c
+LIBJPEG_VERSION = 9d
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
-- 
2.24.1
