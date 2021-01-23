From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jan 2021 18:34:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: needs python3
Message-ID: <20210123173433.3214-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python3 is mandatory since version 0.4.0 and
https://github.com/ukBaz/python-bluezero/commit/55dc0fbc2710a75c9e8f519428e6b10747bf6eb7
https://github.com/ukBaz/python-bluezero/commit/66e1b726d060f3d2b500ba2ec8268cf6743d65e9

Fixes:
 - http://autobuild.buildroot.org/results/cb4d637f1b0ca02377c04d67e20c48784b65c13a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-bluezero/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index ed2277dc31..9ea3686a2b 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python library for Bluetooth Low Energy (BLE) on Linux.
 
-- 
2.29.2
