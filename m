From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 May 2017 00:13:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/dhcp: dhcp server: select systemd
	tmpfile support when systemd is used
In-Reply-To: <20170526221348.19078-1-romain.naour@gmail.com>
References: <20170526221348.19078-1-romain.naour@gmail.com>
Message-ID: <20170526221348.19078-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tmpfile support is optional in systemd but the dhcp server install it's
config file in $(TARGET_DIR)/usr/lib/tmpfiles.d directory when systemd
is used as init system.

So it seems that dhcp server require tmpfile support for systemd based
system.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dhcp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index d09256a..5340830 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_DHCP
 
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
+	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
 	help
 	  DHCP server from the ISC DHCP distribution.
 
-- 
2.9.4
