From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:38 +0200
Subject: [Buildroot] [PATCH 4/9] hal: add dependency on
	host-libxml-parser-perl
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f5ff8cdc62182e3452d5811f1f0a25d3318b66af.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hal integrates its own version of intltool tools, but they require
libxml-parser-perl to be installed on the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hal/hal.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 746107b..262fc41 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -79,7 +79,7 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
 	done
 
-hal: host-pkg-config dbus-glib hwdata udev $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
-- 
1.6.3.3
