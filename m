From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:23:30 +0100
Subject: [Buildroot] [git commit] samba: avahi: replace dependency on dbus
	by select
Message-ID: <20120131112714.430B790961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25728f9a5707a5b03271a22edb92005c88b64ea7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 3a77776..a5a5c29 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -249,12 +249,12 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	default y
 	depends on BR2_PACKAGE_SAMBA
 	depends on BR2_PACKAGE_AVAHI_DAEMON
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	help
 	  Include support for avahi
 
-comment "support avahi - disabled (requires avahi-daemon/dbus)"
-	depends on !BR2_PACKAGE_AVAHI_DAEMON || !BR2_PACKAGE_DBUS
+comment "support avahi - disabled (requires avahi-daemon)"
+	depends on !BR2_PACKAGE_AVAHI_DAEMON
 
 config BR2_PACKAGE_SAMBA_GAMIN
 	bool "support gamin"
