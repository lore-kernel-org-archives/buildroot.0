From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Nov 2013 20:09:48 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: select BR2_LEGACY for
	module-init-tools legacy option
Message-ID: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 94c72087f3 ("module-init-tools: remove package") removed the
module-init-tools package and therefore added the corresponding config
option in Config.in.legacy. However, the commit forgot to add the
"select BR2_LEGACY" that ensures the build cannot proceed until the
user has acknowledged the change (i.e kmod replacing
module-init-tools).

This commit adds this missing "select BR2_LEGACY".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index d02f0a6..587afe1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -123,6 +123,7 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 	bool "module-init-tools replaced by kmod"
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_KMOD_TOOLS
+	select BR2_LEGACY
 	help
 	  The 'module-init-tools' package has been removed, since it
 	  has been depracated upstream and replaced by 'kmod'.
-- 
1.8.1.2
