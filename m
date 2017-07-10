From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Jul 2017 19:51:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
Message-ID: <20170710175137.1402-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gtk support is controlled by ARG_WITH since
https://github.com/transmission/transmission/commit/2ccc2bbbfe2e4a26dfeaa13b56c412ea0af4ebe4

Fixes a build error if libgtk2/3 was built before transmission:
http://autobuild.buildroot.net/results/6b6/6b6ce352a9edfe3aaba82be143092a878e7715ed/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/transmission/transmission.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f8abb2b8b..d84e5cb77 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -82,10 +82,10 @@ TRANSMISSION_CONF_OPTS += --disable-remote
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
-TRANSMISSION_CONF_OPTS += --enable-gtk
+TRANSMISSION_CONF_OPTS += --with-gtk
 TRANSMISSION_DEPENDENCIES += libgtk2
 else
-TRANSMISSION_CONF_OPTS += --disable-gtk
+TRANSMISSION_CONF_OPTS += --without-gtk
 endif
 
 $(eval $(autotools-package))
-- 
2.11.0
