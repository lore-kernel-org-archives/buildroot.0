From: Brent Generous <bgenerous@impinj.com>
Date: Mon, 15 Oct 2018 23:51:15 +0000
Subject: [Buildroot] [PATCH 1/1] dbus-python: add host package
Message-ID: <20181015235048.12213-1-bgenerous@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This can be useful for Python scripts running on a host machine that
need to connect to a bus on a remote device, e.g. test scripts.

Signed-off-by: Brent Generous <bgenerous@impinj.com>
---
 package/dbus-python/dbus-python.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index da04b7404f..cc3fd97c9d 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -29,3 +29,4 @@ DBUS_PYTHON_CONF_ENV += \
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.4
