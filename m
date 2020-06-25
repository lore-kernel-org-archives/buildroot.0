From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 23:14:48 +0200
Subject: [Buildroot] [git commit] package/smstools3: bump to version 3.1.21
Message-ID: <20200625211417.904BE844F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7974d6800428824e33a8a8d35fb78055f5f48034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update patch
- Add link to upstream hashes
- Update hash of doc/license.html (web link update)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/smstools3/0001-fix-Makefile.patch | 8 +++++---
 package/smstools3/smstools3.hash          | 9 ++++++---
 package/smstools3/smstools3.mk            | 2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/smstools3/0001-fix-Makefile.patch b/package/smstools3/0001-fix-Makefile.patch
index 5842357451..338a53e745 100644
--- a/package/smstools3/0001-fix-Makefile.patch
+++ b/package/smstools3/0001-fix-Makefile.patch
@@ -7,6 +7,8 @@ Although make-3.81 is happy about it, make-4.0 (and probably 3.82 too)
 do whine loudly.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Fabrice: update for 3.1.21]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -durN smstools3-3.1.15.orig/src/Makefile smstools3-3.1.15/src/Makefile
 --- smstools3-3.1.15.orig/src/Makefile	2010-09-21 13:29:14.000000000 +0200
@@ -15,15 +17,15 @@ diff -durN smstools3-3.1.15.orig/src/Makefile smstools3-3.1.15/src/Makefile
  
  all: smsd 
  
--smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
+-smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o charshift.o
 -
  ifneq (,$(findstring SOLARIS,$(CFLAGS)))
  ifeq (,$(findstring DISABLE_INET_SOCKET,$(CFLAGS)))
- override LFLAGS += -lsocket -lnsl
+ 	override LFLAGS += -lsocket -lnsl
  endif
  endif
  
-+smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
++smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o charshift.o
  ifneq (,$(findstring NOSTATS,$(CFLAGS)))
  	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)
  else 
diff --git a/package/smstools3/smstools3.hash b/package/smstools3/smstools3.hash
index 9eb73e9380..27eda2af96 100644
--- a/package/smstools3/smstools3.hash
+++ b/package/smstools3/smstools3.hash
@@ -1,4 +1,7 @@
-# Locally calculated
-sha256  ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59  smstools3-3.1.15.tar.gz
-sha256  61ae4d83c30236cc7df40b1ccbbe6be07d334f9579b8d0facecc34334fe15b61  doc/license.html
+# From http://smstools3.kekekasvi.com/packages/
+md5  6a9f038fb38a49cc3a4f8f14a88fb8af smstools-3.1.21.tar.gz
+sha256  a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084  smstools3-3.1.21.tar.gz
+
+# Hash for license files
+sha256  884d8f0377259f291432f4fa31d5a9720eefa0e0d797652ae686b6325a434624  doc/license.html
 sha256  786b4da4dd900cad87a7dc17769458607bdeae575d62e6e98ad7144e9225f8d3  LICENSE
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 2dfd11b8c5..87d189baa8 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMSTOOLS3_VERSION = 3.1.15
+SMSTOOLS3_VERSION = 3.1.21
 SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
 SMSTOOLS3_LICENSE = GPL-2.0+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
