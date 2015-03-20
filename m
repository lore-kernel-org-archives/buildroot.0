From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:36:57 +0100
Subject: [Buildroot] [git commit] dbus: move systemd service files to
	/usr/lib
Message-ID: <20150320194323.552A48181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40f0d87374aea8371f1612fca3ed12b4b152f1b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 200084f..c810800 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DBUS_CONF_OPTS += \
 	--enable-systemd \
-	--with-systemdsystemunitdir=/lib/systemd/system
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
 DBUS_DEPENDENCIES += systemd
 else
 DBUS_CONF_OPTS += --disable-systemd
