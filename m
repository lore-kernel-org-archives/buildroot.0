From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:36:05 +0100
Subject: [Buildroot] [PATCH 3 6/9] avahi: remove double dependency on gettext
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143605.8550.65621.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/avahi/avahi.mk |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5f07a2f..d96f24b 100644
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
