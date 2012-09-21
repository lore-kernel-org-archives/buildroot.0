From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 02:54:17 +0200
Subject: [Buildroot] [PATCH 06/10] avahi: remove double dependency on gettext
In-Reply-To: <20120921004927.11838.37292.stgit@localhost>
References: <20120921004927.11838.37292.stgit@localhost>
Message-ID: <20120921005417.11838.11346.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/avahi/avahi.mk |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 03dc368..6a6f524 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -133,10 +133,7 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-AVAHI_DEPENDENCIES += gettext
-AVAHI_MAKE_OPT = LIBS=-lintl
-endif
+AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 define AVAHI_REMOVE_INITSCRIPT
 	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
