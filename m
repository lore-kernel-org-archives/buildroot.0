From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 15:39:03 +0000
Subject: [Buildroot] [PATCH v2 1/4] package/python3: create an option for
 host package selection
Message-ID: <20191027153853.23532-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a python script, such as the post build one, wants to use python tools
or be written in python, there is no possibility at the moment for enable
it directly in the config, what's more, if python2 is used on the target,
the auto-selected host python interpreter will be python 2.
This patch allows to explicitly enable the host python3 package.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

Changes v1 -> v2:
  - split the two original patches in two
  - removed the ssl support option

---

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/Config.in.host         | 1 +
 package/python3/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python3/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 9eeb5c91a9..3253f9f361 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
+	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
new file mode 100644
index 0000000000..061107fdff
--- /dev/null
+++ b/package/python3/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON3
+	bool "host python3"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
-- 
2.20.1
