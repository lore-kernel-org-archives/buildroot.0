From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:37:09 +0200
Subject: [Buildroot] [git commit] avahi: remove double dependency on gettext
Message-ID: <20130730213928.3F4B89ABC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c2de8da28b859d0ace26743095fb73ae1a94940
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 028f3ae..eb76d79 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -135,10 +135,7 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-AVAHI_DEPENDENCIES += gettext
-AVAHI_MAKE_OPT = LIBS=-lintl
-endif
+AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 define AVAHI_REMOVE_INITSCRIPT
 	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
