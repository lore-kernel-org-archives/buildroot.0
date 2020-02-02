From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 11:45:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/smartmontools: add libselinux
 optional dependency
Message-ID: <20200202104511.3342301-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is an optional dependency since a very long time (2010) and
https://github.com/mirror/smartmontools/commit/ab807ee43bd4821f5e0e010de08a746d88506b17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smartmontools/smartmontools.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 6c90538f70..bad7da2d16 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -16,4 +16,11 @@ else
 SMARTMONTOOLS_CONF_OPTS += --without-libcap-ng
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SMARTMONTOOLS_CONF_OPTS += --with-selinux
+SMARTMONTOOLS_DEPENDENCIES += libselinux
+else
+SMARTMONTOOLS_CONF_OPTS += --without-selinux
+endif
+
 $(eval $(autotools-package))
-- 
2.24.1
