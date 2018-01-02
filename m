From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 10:28:00 -0500
Subject: [Buildroot] [PATCH 1/8] python: add selectable host entry
In-Reply-To: <20180102152807.31470-1-aduskett@gmail.com>
References: <20180102152807.31470-1-aduskett@gmail.com>
Message-ID: <20180102152807.31470-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a user selectable entry to build python2 as a host package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in.host        | 1 +
 package/python/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index dd6415bba5..7d908c409c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -41,6 +41,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/qemu/Config.in.host"
diff --git a/package/python/Config.in.host b/package/python/Config.in.host
new file mode 100644
index 0000000000..0a8d6d179f
--- /dev/null
+++ b/package/python/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON
+	bool "host python"
+	help
+	  The python language interpreter.
+
+	  http://www.python.org/
-- 
2.14.3
