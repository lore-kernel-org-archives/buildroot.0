From: zooey at hirschkaefer.de <zooey@hirschkaefer.de>
Date: Sat, 27 Sep 2014 15:12:21 +0200
Subject: [Buildroot] [RFC 3/3] samba4-HACK: apply
	--disable-rpath-private-install for smbclient
In-Reply-To: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
References: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
Message-ID: <1411823541-4953-4-git-send-email-zooey@hirschkaefer.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Oliver Tappe <zooey@hirschkaefer.de>

Otherwise, the installation of smbclient fails due to missing
*.inst.so files.
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1826c01..b6c8582 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -72,6 +72,7 @@ endif
 ifeq ($(BR2_PACKAGE_SAMBA4_CLIENT_LIB),y)
 	SAMBA4_WAF_BUILD_TARGET = smbclient
 	SAMBA4_WAF_INSTALL_TARGET = install_smbclient
+	SAMBA4_CONF_OPT += --disable-rpath-private-install
 else
 	SAMBA4_WAF_BUILD_TARGET = all
 	SAMBA4_WAF_INSTALL_TARGET = install
-- 
1.8.4.5
