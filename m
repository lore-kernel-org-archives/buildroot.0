From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 22 Oct 2019 20:41:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pymodbus: depends on
 python-pyserial
In-Reply-To: <20191022184116.5981-1-fontaine.fabrice@gmail.com>
References: <20191022184116.5981-1-fontaine.fabrice@gmail.com>
Message-ID: <20191022184116.5981-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pymodbus depends on python-pyserial, not python-serial

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pymodbus/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 0ba6fb88f0..4ebe71f5fc 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
+	select BR2_PACKAGE_PYTHON_PYSERIAL # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
 	  Pymodbus is a full Modbus protocol implementation.
 
-- 
2.23.0
