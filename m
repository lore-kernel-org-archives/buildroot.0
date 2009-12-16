From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] dbus: fix host-dbus build
Message-ID: <20091216153102.B44B977738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81c953073b20b051c96b4bd2310b3a1c8df984a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use correct variable name for the host source directory for
DBUS_HOST_INTROSPECT, and use late binding as HOST_DBUS_DIR only gets
defined later on (by AUTOTARGETS).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ae65b7d..63f3caa 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -64,7 +64,7 @@ HOST_DBUS_CONF_OPT = \
 		--with-xml=expat
 
 # dbus for the host
-DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
+DBUS_HOST_INTROSPECT=$(HOST_DBUS_DIR)/introspect.xml
 
 HOST_DBUS_GEN_INTROSPECT = \
 	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
-- 
1.6.3.3
