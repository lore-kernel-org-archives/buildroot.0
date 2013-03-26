From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 09:12:26 +0100
Subject: [Buildroot] [PATCH] avahi: add missing dependency on host-gettext
Message-ID: <1364285546-4565-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/1dd5993d2ead9a92e2eb73227b19697728950b86/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5f07a2f..e8ca560 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -85,7 +85,8 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkgconf
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
+       host-pkgconf host-gettext
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
-- 
1.7.9.5
