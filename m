From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 15:39:10 +0000
Subject: [Buildroot] [PATCH v2 3/4] package/python: create an option for
 host package selection
In-Reply-To: <20191027153853.23532-1-nicolas.carrier@orolia.com>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
Message-ID: <20191027153853.23532-3-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a python script, such as the post build one, wants to use python2 tools
or is written in python, there is no possibility at the moment for enable
it directly in the config, what's more, if python3 is used on the target,
the auto-selected host python interpreter will be python 3.
This patch allows to explicitly enable the host python 2 package.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

---

Changes v1 -> v2:
  - split the two original patches in two
  - removed the ssl support option

---

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/Config.in.host        | 1 +
 package/python/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 3253f9f361..914491e210 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
diff --git a/package/python/Config.in.host b/package/python/Config.in.host
new file mode 100644
index 0000000000..d960e1862d
--- /dev/null
+++ b/package/python/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON
+	bool "host python"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
-- 
2.20.1
