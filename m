From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 16:30:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/jhead: bump to version 3.0.3
Message-ID: <20190317153036.27661-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jhead/0001-use-ldflags.patch | 16 ----------------
 package/jhead/jhead.hash             |  3 ++-
 package/jhead/jhead.mk               |  2 +-
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 package/jhead/0001-use-ldflags.patch

diff --git a/package/jhead/0001-use-ldflags.patch b/package/jhead/0001-use-ldflags.patch
deleted file mode 100644
index a1d8185a26..0000000000
--- a/package/jhead/0001-use-ldflags.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Make jhead use LDFLAGS for the final link.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura jhead-2.97.orig/makefile jhead-2.97/makefile
---- jhead-2.97.orig/makefile	2013-03-27 09:22:38.759966389 -0300
-+++ jhead-2.97/makefile	2013-03-27 09:25:06.290691745 -0300
-@@ -14,7 +14,7 @@
- 	${CC} $(CFLAGS) -c $< -o $@
- 
- jhead: $(objs) jhead.h
--	${CC} -o jhead $(objs) -lm
-+	${CC} $(LDFLAGS) -o jhead $(objs) -lm
- 
- clean:
- 	rm -f $(objs) jhead
diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
index 55af7a7244..9ee5055f7c 100644
--- a/package/jhead/jhead.hash
+++ b/package/jhead/jhead.hash
@@ -1,2 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256	88cc01da018e242fe2e05db73f91b6288106858dd70f27506c4989a575d2895e	jhead-3.00.tar.gz
+sha256	82194e0128d9141038f82fadcb5845391ca3021d61bc00815078601619f6c0c2	jhead-3.03.tar.gz
+sha256	46c870a208305489eea862ec8b05b030ba1f06d99195f660dc0ba541cc38d82b	readme.txt
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index 8a99915bac..65f8cdb73c 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JHEAD_VERSION = 3.00
+JHEAD_VERSION = 3.03
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
-- 
2.14.1
