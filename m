From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 10:13:23 +0100
Subject: [Buildroot] [PATCH 3/3] pcmanfm: replace dependency on X.org server
	by dependency on libX11
In-Reply-To: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355908403-27224-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no reason for a client program like pcmanfm to depend on the
X.org server. Instead, it should depend on the appropriate X
client libraries, in this case libX11.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/Config.in  |    1 +
 package/pcmanfm/pcmanfm.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index c8b4deb..484192b 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
+	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  An extremly fast and lightweight file manager which features
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 8eaa485..d1c8afb 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,7 +7,7 @@ PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%200.3.5.9/
 PCMANFM_CONF_OPT = --disable-hal
-PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
+PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
 PCMANFM_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.7.9.5
