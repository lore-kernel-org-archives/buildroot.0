From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 Apr 2020 23:30:00 +0200
Subject: [Buildroot] [PATCH] package/python-crossbar: add missing runtime
 dependency on python-werkzeug
Message-ID: <20200408213000.212212-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://github.com/crossbario/crossbar/commit/b9c295d3cfa923b383f93fe534d40e42c56576dc
which has been part of the releases since v19.10.1 has added
werkzeug dependency.

Without werkzeug package, the test TestPythonPy3Crossbar
is failing at runtime with this error:

ModuleNotFoundError: No module named 'werkzeug'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144523

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crossbar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 526d9871be..2b9077ae87 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -39,6 +39,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_U_MSGPACK
 	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
+	select BR2_PACKAGE_PYTHON_WERKZEUG
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	help
 	  Crossbar.io is an open-source WAMP application router that
-- 
2.25.2
