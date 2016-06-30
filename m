From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jun 2016 13:14:25 +0200
Subject: [Buildroot] [git commit] package/Config.in: hide X.org subsections
	if XORG7 isn't enabled
Message-ID: <20160630112034.D7DB781F84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c8b4f846e991773085394fc3dd566dae11a8c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(most of) the individual packages depends on BR2_PACKAGE_XORG7, but the
subsection comments do not, so we end up displaying them when Xorg isn't
enabled which isn't very useful:

[ ] X.org X Window System  ----
    *** X applications ***
    *** X libraries and helper libraries ***
    *** X window managers ***

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4c39b12..1bf7b1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -297,6 +297,8 @@ endif
 	source "package/x11r7/Config.in"
 
 comment "X applications"
+	depends on BR2_PACKAGE_XORG7
+
 	source "package/alsamixergui/Config.in"
 	source "package/apitrace/Config.in"
 	source "package/dillo/Config.in"
@@ -322,10 +324,14 @@ comment "X applications"
 	source "package/yad/Config.in"
 
 comment "X libraries and helper libraries"
+	depends on BR2_PACKAGE_XORG7
+
 	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
 
 comment "X window managers"
+	depends on BR2_PACKAGE_XORG7
+
 	source "package/enlightenment/Config.in"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
