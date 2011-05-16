From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 16 May 2011 21:53:41 +0200
Subject: [Buildroot] adding libiqrf
Message-ID: <BANLkTi=zt4AaA4HZ_bXGGymeZt5=p_2CqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to add libiqrf to buildroot (https://github.com/nandra/libiqrf).
I create simple patch but after running make seems library isn't builded.
I just get:
>>> libiqrf v1.0.0 Extracting
>>> libiqrf v1.0.0 Patching package/libiqrf
>>> libiqrf v1.0.0 Configuring
>>> libiqrf v1.0.0 Building
>>> libiqrf v1.0.0 'Installing to staging directory'
>>> libiqrf v1.0.0 Installing to target

This library has dependency to libusb which is also added.

patch:
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
new file mode 100644
index 0000000..a9e5a52
--- /dev/null
+++ b/package/libiqrf/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBIQRF
+        bool "libiqrf"
+        depends on BR2_PACKAGE_LIBUSB
+        help
+          Libiqrf is a C library for reading and writing a
+          data do iqrf usb devices (http://iqrf.orf)
+
+          https://github.com/nandra/libiqrf
+
+
+
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
new file mode 100644
index 0000000..524da0f
--- /dev/null
+++ b/package/libiqrf/libiqrf.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libiqrf library
+#
+#############################################################
+
+LIBIQRF_VERSION = v1.0.0
+LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
+LIBIQRF_INSTALL_STAGING = YES
+LIBIQRF_INSTALL_TARGET = YES
+
+LIBIQRF_DEPENDENCIES = libusb
+
+
+$(eval $(call GENTARGETS,package,libiqrf))
+

Any ideas why it doesn't work?

thanks,

marek
-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
