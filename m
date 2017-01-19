From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 13:10:08 +1100
Subject: [Buildroot] [git commit] cups: bump version to 2.2.2
Message-ID: <20170119021549.0618B80333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e662be891715a364425f2f182941bca772c7240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And tweak 0003-Sanitize-the-installation-process.patch for this new
release.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/0003-Sanitize-the-installation-process.patch | 14 +++++++-------
 package/cups/cups.hash                                    |  2 +-
 package/cups/cups.mk                                      |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/cups/0003-Sanitize-the-installation-process.patch b/package/cups/0003-Sanitize-the-installation-process.patch
index 25bfa42..bf81f68 100644
--- a/package/cups/0003-Sanitize-the-installation-process.patch
+++ b/package/cups/0003-Sanitize-the-installation-process.patch
@@ -18,13 +18,16 @@ cross-compiling:
    prevent overwriting those files/directories, which meant calling
    "make install" twice was failing.
 
+[Vincent: tweak the patch for 2.2.2 release]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
  Makedefs.in        | 12 ++++++------
  conf/Makefile      |  6 +++---
  notifier/Makefile  |  2 +-
- scheduler/Makefile | 17 ++++++++---------
- 4 files changed, 18 insertions(+), 19 deletions(-)
+ scheduler/Makefile | 15 +++++++--------
+ 4 files changed, 17 insertions(+), 18 deletions(-)
 
 diff --git a/Makedefs.in b/Makedefs.in
 index 3afef0a..3e4f1bd 100644
@@ -84,18 +87,15 @@ index 3206dd0..c34a4d7 100644
  
  #
 diff --git a/scheduler/Makefile b/scheduler/Makefile
-index c7d244d..a96a528 100644
+index 251f017..25f2f5f 100644
 --- a/scheduler/Makefile
 +++ b/scheduler/Makefile
-@@ -148,30 +148,29 @@ install-data:
+@@ -146,28 +146,27 @@ install-data:
  	echo Creating $(SERVERBIN)/driver...
  	$(INSTALL_DIR) -m 755 $(SERVERBIN)/driver
  	echo Creating $(SERVERROOT)...
 -	$(INSTALL_DIR) -m 755 -g $(CUPS_GROUP) $(SERVERROOT)
 +	$(INSTALL_DIR) -m 755 $(SERVERROOT)
- 	echo Creating $(SERVERROOT)/interfaces...
--	$(INSTALL_DIR) -m 755 -g $(CUPS_GROUP) $(SERVERROOT)/interfaces
-+	$(INSTALL_DIR) -m 755 $(SERVERROOT)/interfaces
  	echo Creating $(SERVERROOT)/ppd...
 -	$(INSTALL_DIR) -m 755 -g $(CUPS_GROUP) $(SERVERROOT)/ppd
 +	$(INSTALL_DIR) -m 755 $(SERVERROOT)/ppd
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 2d103f2..08c8c3c 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 4b14fd833180ac529ebebea766a09094c2568bf8426e219cb3a1715304ef728d  cups-2.1.4-source.tar.gz
+sha256 f589bb7d5d1dc3aa0915d7cf2b808571ef2e1530cd1a6ebe76ae8f9f4994e4f6  cups-2.2.2-source.tar.gz
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2f8a18e..0573776 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.1.4
+CUPS_VERSION = 2.2.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
-CUPS_SITE = https://github.com/apple/cups/releases/download/release-$(CUPS_VERSION)
+CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = GPLv2 LGPLv2
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
