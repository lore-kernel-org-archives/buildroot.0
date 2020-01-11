From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 11:48:53 +0100
Subject: [Buildroot] [git commit] package/libsigrok: fix bluez5_utils
 dependency
Message-ID: <20200111104019.0006689139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0704fa59abd5fc784a8b3e099a8549084619782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ab390616eb74fcb982c886408b53489dc42179bb wrongly added a
bluez_utils5 dependency instead of bluez5_utils

Fixes:
 - http://autobuild.buildroot.org/results/942aa07547068c9b47ce50c6dc016ee633e1a1c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 922011af7c..4866ec4d68 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -17,7 +17,7 @@ LIBSIGROK_CONF_OPTS += --with-libbluez
 LIBSIGROK_DEPENDENCIES += bluez_utils
 else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 LIBSIGROK_CONF_OPTS += --with-libbluez
-LIBSIGROK_DEPENDENCIES += bluez_utils5
+LIBSIGROK_DEPENDENCIES += bluez5_utils
 else
 LIBSIGROK_CONF_OPTS += --without-libbluez
 endif
