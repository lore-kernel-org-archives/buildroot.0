From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:06:31 -0400
Subject: [Buildroot] [PATCH 02/05] package/python-autobahn: bump to version
 19.8.1
In-Reply-To: <20190804010634.85332-1-aduskett@gmail.com>
References: <20190804010634.85332-1-aduskett@gmail.com>
Message-ID: <20190804010634.85332-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In additon:
 - select python-cryptography as it's now a runtime dependency
 - Gix a typo in the help.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-autobahn/Config.in            | 3 ++-
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 7e1429cdd7..de7bb3662a 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	help
-	  WebSocket client Hhh server library, WAMP real-time
+	  WebSocket client & server library, WAMP real-time
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index dce40f160e..344fc8d6a4 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	b296b8ae0f42e7df8052b28d574ede82  autobahn-19.1.1.tar.gz
-sha256	aebbadb700c13792a2967c79002855d1153b9ec8f2949d169e908388699596ff  autobahn-19.1.1.tar.gz
+md5	e6045ea79a9c22f6ad1810670d833bcc  autobahn-19.8.1.tar.gz
+sha256	294e7381dd54e73834354832604ae85567caf391c39363fed0ea2bfa86aa4304  autobahn-19.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 213e0314c9..56e6d54227 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 19.1.1
+PYTHON_AUTOBAHN_VERSION = 19.8.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/66/cc/1e2b20dc6654d9a87fc30da36bfae687ec65428814378c44257a26fe5f2f
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/7b/b9/3460d9f73aba656f06a22f2bbc92e1c31e567372d66614651582858c93ae
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-- 
2.21.0
