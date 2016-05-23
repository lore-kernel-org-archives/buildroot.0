From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:56:00 +0200
Subject: [Buildroot] [git commit] package/hplip: fix static linking with cups
Message-ID: <20160523105605.A27B481D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=012e10bf6215cbfc8006003e42dee8167d6cd1ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c52/c5277c42344d194e004dcd0a5af71bc6110da97e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hplip/hplip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index b1e8cb5..d70e2e9 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -27,6 +27,9 @@ HPLIP_CONF_OPTS = \
 	--enable-new-hpcups \
 	--enable-lite-build
 
+# build system does not support cups-config
+HPLIP_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/cups-config --libs`
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 HPLIP_CONF_OPTS += --enable-dbus-build
 HPLIP_DEPENDENCIES += dbus
