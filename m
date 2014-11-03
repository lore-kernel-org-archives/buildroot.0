From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 23:01:34 +0100
Subject: [Buildroot] [git commit] qt5: select qt5base
Message-ID: <20141103220809.AE316B1B32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e5b076fe3683bd83993497383a7a8bce872266f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base is (as the name hints) the basics of anything related to qt5, so
enabling qt5 without enabling qt5base doesn't make any sense as nothing will
get built.

Selecting it here also simplifies the upcoming series to add qt5 support to
external qt modules.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 83f02f1..c34bec2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -24,6 +24,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT5BASE
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
