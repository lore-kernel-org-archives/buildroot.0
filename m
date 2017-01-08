From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  8 Jan 2017 23:20:11 +0100
Subject: [Buildroot] [PATCH] legacy/xserver: add a legacy entry for xserver
	>= 1.19.0
In-Reply-To: <20170108222011.3839-1-romain.naour@gmail.com>
References: <20170108222011.3839-1-romain.naour@gmail.com>
Message-ID: <20170108222011.3839-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The legacy entry was missing in commit [1].

[1] ec502ea8e4fec1e113b5f7c532809a05644a9fd4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 20445b8..8dfbbc8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
+	bool "xserver AIGLX Extension removed"
+	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 && !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	select BR2_LEGACY
+	help
+	  The xserver AIGLX Extension has been removed in 1.19.0 release.
+
 config BR2_PACKAGE_PERL_DB_FILE
 	bool "perl-db-file removed"
 	select BR2_LEGACY
-- 
2.9.3
