From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Jun 2013 12:15:48 -0300
Subject: [Buildroot] [PATCH] git: needs zlib and host-gettext
Message-ID: <1370272548-32532-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-gettext fixes:
http://autobuild.buildroot.net/results/a5b/a5b1bb708d62a9e296f05899f0984087fcf9e2ce/

zlib fixes:
http://autobuild.buildroot.net/results/08f/08f5ed4dd35ad1ce06dda7577aae87b9aa7069b2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/git/Config.in | 1 +
 package/git/git.mk    | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/git/Config.in b/package/git/Config.in
index 31e5ffe..dc342aa 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Git is a free and open source distributed version control system
 	  designed to handle everything from small to very large projects.
diff --git a/package/git/git.mk b/package/git/git.mk
index 408456b..6bc9761 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -8,10 +8,7 @@ GIT_VERSION         = 1.8.3
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-	GIT_DEPENDENCIES += zlib
-endif
+GIT_DEPENDENCIES    = zlib host-gettext
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	GIT_DEPENDENCIES += openssl
-- 
1.8.1.5
