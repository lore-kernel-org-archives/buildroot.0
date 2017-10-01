From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Oct 2017 11:58:08 +0200
Subject: [Buildroot] [PATCH 1/2] matchbox-lib: select dependency
In-Reply-To: <cover.1506851870.git.yann.morin.1998@free.fr>
References: <cover.1506851870.git.yann.morin.1998@free.fr>
Message-ID: <fc7e8fd1cfa1d2ffee7e0ec0ac91f787e9caef45.1506851870.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the library we build-depend on.

Add myself to developpers for matchbos packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 DEVELOPERS                     | 1 +
 package/matchbox-lib/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cedf5a6f84..5a1ca877de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1819,6 +1819,7 @@ F:	package/libinput/
 F:	package/libiscsi/
 F:	package/libseccomp/
 F:	package/linux-tools/
+F:	package/matchbox*
 F:	package/mesa3d-headers/
 F:	package/nbd/
 F:	package/nut/
diff --git a/package/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
index e50a5436c1..d758ab35a8 100644
--- a/package/matchbox-lib/Config.in
+++ b/package/matchbox-lib/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_MATCHBOX_LIB
 	bool "matchbox-lib"
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  Matchbox common functionality library.
-- 
2.11.0
