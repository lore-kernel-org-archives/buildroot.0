From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:32 +0200
Subject: [Buildroot] [PATCH 12/19] samba: only require libiconv if
	!BR2_ENABLE_LOCALE
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0317b30912eb73bc512b137b1581ff520b14c40a.1274428596.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/Config.in |    2 +-
 package/samba/samba.mk  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 720ecd7..a7a0b34 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
-	select BR2_PACKAGE_LIBICONV
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
 	  including the numerous versions of Microsoft Windows
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 4115363..39968a9 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -16,7 +16,7 @@ SAMBA_INSTALL_TARGET = YES
 
 
 SAMBA_DEPENDENCIES = \
-	libiconv \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi) \
-- 
1.6.3.3
