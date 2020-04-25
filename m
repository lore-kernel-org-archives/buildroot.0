From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:26:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-crossbar:
 add missing runtime dependency on python-werkzeug
Message-ID: <20200425071219.76C6A8FC60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c63a7909a967235ce0d916d09a6da2d8e527e57d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d4a545630601e5133329e588bd504571a69e385)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
