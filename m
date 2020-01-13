From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:18:35 +0100
Subject: [Buildroot] [git commit] package/mutt: bump to version 1.13.3
Message-ID: <20200113201115.52A2581751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42603b3872a0eed5a5a3dda13843fb5835f15a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sqlite is an optional dependency since
https://gitlab.com/muttmua/mutt/commit/1fe2980d3b1a429bf14e8d6286ac4f06d0c666e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index d4b7a70cad..f0b0153221 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bc42750ce8237742b9382f2148fc547a8d8601aa4a7cd28c55fe7ca045196882  mutt-1.12.2.tar.gz
+sha256 78423016b5f2fcb31bfd156999ff6638177be4459230d2ee61a81e5641d07378  mutt-1.13.3.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 40212631cc..e729cc3664 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.12.2
+MUTT_VERSION = 1.13.3
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
@@ -51,6 +51,13 @@ else
 MUTT_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+MUTT_DEPENDENCIES += sqlite
+MUTT_CONF_OPTS += --with-sqlite3
+else
+MUTT_CONF_OPTS += --without-sqlite3
+endif
+
 # Avoid running tests to check for:
 #  - target system is *BSD
 #  - C99 conformance (snprintf, vsnprintf)
