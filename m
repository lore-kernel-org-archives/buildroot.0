From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:35:18 +0100
Subject: [Buildroot] [git commit] libgtk2: point to the proper cups-config
Message-ID: <20160326203523.C251E817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d41722e4f4869d3a0b70ec588db391f3e4f3fdce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it can pick up the distro cups-config if it's present, leading
to improper library usage/linkage. Fixes:
http://autobuild.buildroot.net/results/bf4/bf493977817a750427aae82e71a5257187bd7344/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 971e33c..94fa97f 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -85,6 +85,7 @@ LIBGTK2_CONF_OPTS += --without-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK2_CONF_OPTS += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
 LIBGTK2_DEPENDENCIES += cups
 else
 LIBGTK2_CONF_OPTS += --disable-cups
