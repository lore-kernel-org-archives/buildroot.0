From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 19 Mar 2017 21:51:54 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xserver_xorg-server: bump to
	version 1.19.3
In-Reply-To: <20170319205155.3333-1-romain.naour@gmail.com>
References: <20170319205155.3333-1-romain.naour@gmail.com>
Message-ID: <20170319205155.3333-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../{1.19.2 => 1.19.3}/0001-modesettings-needs-dri2.patch             | 0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch             | 0
 .../{1.19.2 => 1.19.3}/0003-Remove-check-for-useSIGIO-option.patch    | 0
 package/x11r7/xserver_xorg-server/Config.in                           | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash            | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename package/x11r7/xserver_xorg-server/{1.19.2 => 1.19.3}/0001-modesettings-needs-dri2.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.19.2 => 1.19.3}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.19.2 => 1.19.3}/0003-Remove-check-for-useSIGIO-option.patch (100%)

diff --git a/package/x11r7/xserver_xorg-server/1.19.2/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.19.3/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.2/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.19.3/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.19.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.19.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.2/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.19.3/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.2/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.19.3/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 032811e..b04ccf4 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -79,7 +79,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "1.19.2"
+	bool "1.19.3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
@@ -99,7 +99,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.19.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 456fb8b..b7b4635 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,5 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2017-March/002779.html
-sha256 4f8ab9f4a1a885fe7550080555381b34b82858582559e8e3c4da96e3a85884bb        xorg-server-1.19.2.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg/2017-March/058662.html
+sha256 8f93b98f1ac9fbd87515bfe329a069b48bbec98e5329584ab5fbf759a0953b8d        xorg-server-1.19.3.tar.bz2
-- 
2.9.3
