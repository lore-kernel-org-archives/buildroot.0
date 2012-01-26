From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:29 +0100
Subject: [Buildroot] [PATCH 3/6] samba: avahi: replace dependency on dbus by
	select
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <1327621292-13580-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
1.7.8.3
