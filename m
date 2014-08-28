From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 23:03:45 +0200
Subject: [Buildroot] [PATCH 2/2] packages: no longer pass
	--disable-dependency-tracking in individual packages
In-Reply-To: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1409259825-619-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that --disable-dependency-tracking is passed by the
autotools-package infrastructure, there's no longer any reason to pass
it in individual packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/agentpp/agentpp.mk     | 3 +--
 package/coreutils/coreutils.mk | 1 -
 package/iperf/iperf.mk         | 1 -
 package/metacity/metacity.mk   | 1 -
 package/mysql/mysql.mk         | 1 -
 5 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 46cdc1d..3656fb1 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -14,7 +14,6 @@ AGENTPP_DEPENDENCIES = host-pkgconf snmppp
 AGENTPP_CONF_OPT += \
 	--disable-proxy \
 	--disable-forwarder \
-	--disable-rpath \
-	--disable-dependency-tracking
+	--disable-rpath
 
 $(eval $(autotools-package))
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index af202b4..07a1347 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -61,7 +61,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		PERL=missing
 
 COREUTILS_CONF_OPT = --disable-rpath \
-		--disable-dependency-tracking \
 		--enable-install-program=hostname
 
 define COREUTILS_POST_INSTALL
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index c570d67..1e5606e 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -13,7 +13,6 @@ IPERF_CONF_ENV = \
 	ac_cv_sizeof_bool=1
 
 IPERF_CONF_OPT = \
-	--disable-dependency-tracking \
 	--disable-web100
 
 $(eval $(autotools-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 6ded5d1..60c6250 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -15,7 +15,6 @@ METACITY_LICENSE_FILES = COPYING
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest --disable-gconf \
-		--disable-dependency-tracking \
 		--disable-sm --disable-startup-notification
 
 METACITY_DEPENDENCIES = libgtk2 \
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 0802860..e5124d5 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -51,7 +51,6 @@ HOST_MYSQL_CONF_OPT = \
 
 MYSQL_CONF_OPT += \
 	--localstatedir=/var/mysql \
-	--disable-dependency-tracking \
 	--with-atomic-ops=up \
 	--with-embedded-server \
 	--without-query-cache \
-- 
2.0.0
