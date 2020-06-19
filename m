From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 19 Jun 2020 16:57:18 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/cups: adding python support
In-Reply-To: <20200619145719.2352019-1-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
Message-ID: <20200619145719.2352019-7-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables python support if python is available.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/cups.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 617b402969..67690b61c4 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -75,6 +75,13 @@ else
 CUPS_CONF_OPTS += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+CUPS_CONF_OPTS += --with-python
+CUPS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+else
+CUPS_CONF_OPTS += --without-python
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define CUPS_INSTALL_UDEV_RULES
 	$(INSTALL) -D -m 0644 package/cups/70-usb-printers.rules \
-- 
2.25.1
