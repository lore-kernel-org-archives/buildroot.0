From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 Jan 2015 22:03:23 +0100
Subject: [Buildroot] [PATCH] package/git: fix dependency against curl
Message-ID: <1420664603-8621-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our curl package is really named libcurl.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: no attempt was made to check if the curl binary was needed, or
if it was just libcurl. The patch just fixes the dependency,
Buildroot-wise.
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 57737f2..face062 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -26,7 +26,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_CURL),y)
-	GIT_DEPENDENCIES += curl
+	GIT_DEPENDENCIES += libcurl
 	GIT_CONF_OPTS += --with-curl
 else
 	GIT_CONF_OPTS += --without-curl
-- 
1.9.1
