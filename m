From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 02:59:37 +0200
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support IPv6
	lease file
In-Reply-To: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The IPv6 lease file has a different name.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>

---
Changes v2 -> v3: new patch.
---
 package/dhcp/dhcp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c05e694..3aa1577 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -83,6 +83,8 @@ define DHCP_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
 	echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
+	echo "f /var/lib/dhcp/dhcpd6.leases - - - - -" >> \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
 endef
 endif
 
-- 
2.1.4
