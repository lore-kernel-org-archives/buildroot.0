From: Alexander Dahl <post@lespocky.de>
Date: Tue,  1 Jun 2021 09:03:16 +0200
Subject: [Buildroot] [PATCH/stable] package/putty: Ignore CVE-2021-33500
Message-ID: <20210601070316.27441-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since putty is only affected by this CVE on Windows, ignore it in the
stable branch.  Branch master is not affected anymore already, due to
newer version which got fixed.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/putty/putty.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index c40cac9dc5..8a494d4e54 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -12,6 +12,9 @@ PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
 PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
+# Windows only, fixed for Windows with 0.75
+PUTTY_IGNORE_CVES += CVE-2021-33500
+
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
 PUTTY_DEPENDENCIES += libgtk2

base-commit: 677b20cf240d099e1bfc1d50e54730083618d24f
-- 
2.20.1
