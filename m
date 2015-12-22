From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Dec 2015 07:46:11 -0300
Subject: [Buildroot] [PATCH] rsync: security bump to version 3.1.2
Message-ID: <1450781171-19849-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
Make sure that all transferred files use only path names from inside the
transfer.  This makes it impossible for a malicious sender to try to
make the receiver use an unsafe destination path for a transferred file,
such as a just-sent symlink.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsync/rsync.hash | 2 +-
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 032047d..6311116 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621	rsync-3.1.1.tar.gz
+sha256	ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2	rsync-3.1.2.tar.gz
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index f326389..e1e850c 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.1.1
+RSYNC_VERSION = 3.1.2
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
 RSYNC_LICENSE_FILES = COPYING
-- 
2.4.10
