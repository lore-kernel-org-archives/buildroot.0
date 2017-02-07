From: Ilias Apalodimas <apalos@gmail.com>
Date: Tue, 7 Feb 2017 16:35:59 +0200
Subject: [Buildroot] keepalived support
Message-ID: <CADvJCoeZWzF+QOOb5amdVyP+gCRZDMA12Zi3ZeAuZqxafuoXDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sending inline patch, the .patch file was scrubbed.

BR
Ilias


diff --git a/package/Config.in b/package/Config.in
index 114a5ad..f0f1dec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1546,6 +1546,7 @@ menu "Networking applications"
    source "package/irssi/Config.in"
    source "package/iw/Config.in"
    source "package/janus-gateway/Config.in"
+   source "package/keepalived/Config.in"
    source "package/kismet/Config.in"
    source "package/knock/Config.in"
    source "package/leafnode2/Config.in"
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
new file mode 100644
index 0000000..efa07e1
--- /dev/null
+++ b/package/keepalived/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_KEEPALIVED
+   bool "keepalived"
+   depends on BR2_PACKAGE_POPT && BR2_PACKAGE_OPENSSL
+   help
+     Keepalived package.
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
new file mode 100644
index 0000000..9073376
--- /dev/null
+++ b/package/keepalived/keepalived.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# keepalived
+#
+################################################################################
+
+KEEPALIVED_VERSION = 1.3.2
+KEEPALIVED_SOURCE = keepalived-$(KEEPALIVED_VERSION).tar.gz
+KEEPALIVED_SITE = http://www.keepalived.org/software
+KEEPALIVED_DEPENDENCIES = popt openssl
+KEEPALIVED_LICENSE = GPLv2
+KEEPALIVED_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
