From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Aug 2013 18:36:25 +0200
Subject: [Buildroot] [git commit] webkit: Fix comment dependency for
	BR2_PACKAGE_LIBGTK2
Message-ID: <20130815163613.010399B3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdb0498b2cbbbda180f144bc6431cadaed3c870d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment should only be displayed if BR2_PACKAGE_LIBGTK2
is not selected.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 789e427..44a208a 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -26,5 +26,5 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit requires libgtk2 and a toolchain with C++, WCHAR, threading support"
-	depends on BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
