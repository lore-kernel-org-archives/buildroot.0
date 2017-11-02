From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  2 Nov 2017 11:45:20 +0100
Subject: [Buildroot] [PATCH 4/4] qt5webengine: only available on x86(-64)
 hosts
In-Reply-To: <20171102104520.29257-1-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
Message-ID: <20171102104520.29257-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -m32 compiler flag is used for 32bit builds and the host tools have
limited architecture support, so limit to x86(-64) hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webengine/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 6b68d1b2a8..d40b58062e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_arm || \
 		BR2_i386 || BR2_x86_64 || \
 		BR2_mips || BR2_mips64
+	# -m32 flag is used for 32bit builds and host tools have
+	# limited architecture support
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
-- 
2.11.0
