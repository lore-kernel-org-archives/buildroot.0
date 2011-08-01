From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  1 Aug 2011 23:46:16 +0200
Subject: [Buildroot] [PATCH 3/3] samba: make installation of smbd
	configurable
In-Reply-To: <1312235176-31058-1-git-send-email-s.neumann@raumfeld.com>
References: <1312235176-31058-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1312235176-31058-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It may be desirable to compile samba but not actually install
the smbd binary. This is the case if you need libsmbclient but
don't want to run a samba server.

Make this possible by allowing to disable installation of smbd.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/Config.in |    7 +++++++
 package/samba/samba.mk  |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 58a84f3..c4fb456 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -122,6 +122,13 @@ config BR2_PACKAGE_SAMBA_SMBCQUOTAS
 	help
 	  Set or get QUOTAs of NTFS 5 shares
 
+config BR2_PACKAGE_SAMBA_SMBD
+	bool "smbd"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  The server daemon that provides filesharing and printing services,
+
 config BR2_PACKAGE_SAMBA_SMBGET
 	bool "smbget"
 	default y
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index b3fbd4b..2bb0530 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -110,6 +110,7 @@ SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS) += usr/bin/smbcacls
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT) += usr/bin/smbclient
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL) += usr/bin/smbcontrol
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS) += usr/bin/smbcquotas
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBD) += usr/sbin/smbd
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBGET) += usr/bin/smbget
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbadd
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbdel
-- 
1.7.4.1
