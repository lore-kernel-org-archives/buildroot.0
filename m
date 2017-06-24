From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 23:27:12 +0200
Subject: [Buildroot] [git commit] package/dhcp: dhcp server: select systemd
	tmpfile support when systemd is used
Message-ID: <20170624212642.374D581938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51a24f8d71afef70ef42ab3e062277f2d602a278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tmpfile support is optional in systemd but the dhcp server install it's
config file in $(TARGET_DIR)/usr/lib/tmpfiles.d directory when systemd
is used as init system.

So it seems that dhcp server require tmpfile support for systemd based
system.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
