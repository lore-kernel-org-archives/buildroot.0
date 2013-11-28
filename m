From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:48:15 +0100
Subject: [Buildroot] [git commit] grantlee: Disable on non-supported
	platforms
Message-ID: <20131128214913.9B77C9BAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a88dceb951de977ad2d896d697f87d98e9705280
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package selects BR2_PACKAGE_QT_SCRIPT which is not supported on
certain platforms. To prevent this behaviour we use the same solution as
we applied for BR2_PACKAGE_QT_SCRIPT

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
