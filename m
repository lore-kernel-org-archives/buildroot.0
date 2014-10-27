From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:12 -0700
Subject: [Buildroot] [PATCH 04/15 v6] package/systemd: is a provider for
	libudev
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <c8708363b7e7af8a2094edf7bf10dcf98f66243f.1414442699.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index be28975..de5c39e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # libcap
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
@@ -61,6 +62,9 @@ config BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 75a32f4..ce05f06 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -17,7 +17,7 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	host-gperf
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
-- 
1.9.1
