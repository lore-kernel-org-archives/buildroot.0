From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] samba: make installation of smbd
	configurable
Message-ID: <20110912052631.1840E8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ede8ca0019974fc999c6e9f20dfbedfeb9649c60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It may be desirable to compile samba but not actually install
the smbd binary. This is the case if you need libsmbclient but
don't want to run a samba server.

Make this possible by allowing to disable installation of smbd.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/Config.in |    7 +++++++
 package/samba/samba.mk  |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 58a84f3..3a77776 100644
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
+	  The server daemon that provides filesharing and printing services
+
 config BR2_PACKAGE_SAMBA_SMBGET
 	bool "smbget"
 	default y
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index dfc7636..621d13c 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -111,6 +111,7 @@ SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS) += usr/bin/smbcacls
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT) += usr/bin/smbclient
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL) += usr/bin/smbcontrol
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS) += usr/bin/smbcquotas
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBD) += usr/sbin/smbd
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBGET) += usr/bin/smbget
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbadd
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbdel
-- 
1.7.3.4
