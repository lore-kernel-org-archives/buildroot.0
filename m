From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Sep 2017 23:58:40 +0200
Subject: [Buildroot] [git commit] package/transmission: fix gtk support
Message-ID: <20170901231151.D50C2818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e67fbcfa94e58a4d04e081be5e318953233492c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gtk support is controlled by ARG_WITH since
https://github.com/transmission/transmission/commit/2ccc2bbbfe2e4a26dfeaa13b56c412ea0af4ebe4

Fixes a build error if libgtk2/3 was built before transmission:
http://autobuild.buildroot.net/results/6b6/6b6ce352a9edfe3aaba82be143092a878e7715ed/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 0fce642..f2333cb 100644
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
