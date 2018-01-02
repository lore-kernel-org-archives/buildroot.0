From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 11:33:31 -0500
Subject: [Buildroot] [PATCH 2/8] python3: add selectable host entry
In-Reply-To: <20180102163337.6334-1-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
Message-ID: <20180102163337.6334-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a user selectable entry to build python3 as a host package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in.host         | 1 +
 package/python3/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python3/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 7d908c409c..19d45e9d9e 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -42,6 +42,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
+	source "package/python3/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/qemu/Config.in.host"
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
new file mode 100644
index 0000000000..876661e71b
--- /dev/null
+++ b/package/python3/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON3
+	bool "host python3"
+	help
+	  The python language interpreter.
+
+	  http://www.python.org/
-- 
2.14.3
