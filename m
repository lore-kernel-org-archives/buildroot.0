From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 09:14:31 +0100
Subject: [Buildroot] [PATCH 1/6] avahi: add dependency on host-intltool
In-Reply-To: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7ba5e386296f1b77ab25984773a690337461260a.1267172039.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without intltool, configuration fails with:

checking for intltool >= 0.35.0... ./configure: line 28714: intltool-update: command not found
 found

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 0c9d11e..b3e1d9b 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -82,7 +82,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext)
+AVAHI_DEPENDENCIES = $(if $(BR2_PACKAGE_GETTEXT),gettext) host-intltool
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
-- 
1.6.3.3
