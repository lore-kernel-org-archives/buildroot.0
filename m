From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:30 +0100
Subject: [Buildroot] [PATCH 4/6] qt: qt-dbus: replace dependency on dbus by
	select
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <1327621292-13580-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ab231d9..3a552d0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -280,12 +280,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  If unsure, say n.
 endif
 
-comment "Qt Dbus module not available (needs dbus)"
-	depends on !BR2_PACKAGE_DBUS
-
 config BR2_PACKAGE_QT_DBUS
 	bool "DBus Module"
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
 
-- 
1.7.8.3
