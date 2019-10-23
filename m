From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 23 Oct 2019 08:43:24 +0000
Subject: [Buildroot] [PATCH v3] package/ofono: use external ell library
Message-ID: <20191023084257.94891-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

---
Changes v2 -> v3:
  - Force the use of external ell library

Changes v1 -> v2:
  - Remove forced autoreconf into another patch
  - Add missing OFONO_DEPENDENCIES
  - Add disable option if ell is not selected
---
 package/ofono/Config.in | 1 +
 package/ofono/ofono.mk  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 70daef7a1b..5fe367a1de 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_OFONO
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
+	select BR2_PACKAGE_ELL
 	help
 	  oFono is a free, open source project for mobile telephony
 	  (GSM/UMTS) applications. It uses high-level D-Bus API for
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 95a6c8c599..4f6123a631 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -14,9 +14,11 @@ OFONO_DEPENDENCIES = \
 	dbus \
 	libglib2 \
 	libcap-ng \
-	mobile-broadband-provider-info
+	mobile-broadband-provider-info \
+	ell
 
 OFONO_CONF_OPTS = \
+	--enable-external-ell \
 	--disable-test \
 	--with-dbusconfdir=/etc \
 	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
-- 
2.23.0
