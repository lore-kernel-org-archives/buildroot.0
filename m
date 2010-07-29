From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:54 +0200
Subject: [Buildroot] [PATCH 11/19] avahi: pkg-config is needed
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9abe052f0438ea106274dd3dcbe34736460245a5.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index fa05de3..8e2d14f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -84,7 +84,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool host-pkg-config
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
-- 
1.7.0.4
