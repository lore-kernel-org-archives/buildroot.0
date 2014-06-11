From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 12:53:03 +0200
Subject: [Buildroot] [git commit] znc: not available on !MMU systems,
	uses fork()
Message-ID: <20140611111743.260FD9B9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=818ef1ea39f64e15e93e36431c59a8b918163721
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index c055f9f..274e537 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ZNC
 	bool "znc"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Advanced IRC bouncer
 
@@ -8,3 +9,4 @@ config BR2_PACKAGE_ZNC
 
 comment "znc needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
