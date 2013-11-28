From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Nov 2013 15:57:15 +0000
Subject: [Buildroot] [PATCH v3 2/2] grantlee: Disable on non-supported
	platforms
In-Reply-To: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1385654237-36389-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package selects BR2_PACKAGE_QT_SCRIPT which is not supported on 
certain platforms. To prevent this behaviour we use the same solution as 
we applied for BR2_PACKAGE_QT_SCRIPT

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/grantlee/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 84afad2..09ec70c 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_SCRIPT
 	select BR2_PACKAGE_QT_GUI_MODULE
-- 
1.7.1
