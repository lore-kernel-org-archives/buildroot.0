From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  6 Sep 2018 00:22:13 +0200
Subject: [Buildroot] [PATCH v5 3/3] package/nodejs: taint the build on
 external modules
In-Reply-To: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1536186133-9933-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables the tainting of the build when an
external module is added.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/nodejs/nodejs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e2c94ba..322a1ec 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -160,6 +160,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 # We can only call NPM if there's something to install.
 #
 ifneq ($(NODEJS_MODULES_LIST),)
+NODEJS_TAINTS = YES
 define NODEJS_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
-- 
2.7.4
