From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 13:05:27 +0200
Subject: [Buildroot] [PATCH 2/2] pkgconf: expose the host variant in
	menuconfig
In-Reply-To: <20170919110527.23975-1-peter@korsgaard.com>
References: <20170919110527.23975-1-peter@korsgaard.com>
Message-ID: <20170919110527.23975-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the addition of the sdk support it may be interesting to build
host-pkgconf even though no packages need it, so expose it in menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host         | 1 +
 package/pkgconf/Config.in.host | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 package/pkgconf/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c5a852b858..df3893aa9c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
+	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-lxml/Config.in.host"
diff --git a/package/pkgconf/Config.in.host b/package/pkgconf/Config.in.host
new file mode 100644
index 0000000000..437a7bf6f9
--- /dev/null
+++ b/package/pkgconf/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PKGCONF
+	bool "host pkgconf"
+	help
+	  pkgconf is a program which helps to configure compiler and linker
+	  flags for development frameworks. It is similar to pkg-config,
+	  but was written from scratch in the summer of 2011 to replace
+	  pkg-config, which now needs itself to build itself
+
+	  https://github.com/pkgconf/pkgconf
-- 
2.11.0
