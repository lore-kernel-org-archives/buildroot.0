From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:29:21 +0200
Subject: [Buildroot] [git commit] docs/manual/adding-packages-python.txt:
 fix outdated Python 3 explanation
Message-ID: <20190910172510.80B008DE55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c553ba594af3d7bc710cac5e53c6d38f882c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python packages should no longer depend on BR2_PACKAGE_PYTHON in their
config file, unless they are only compatible with Python 2.

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-python.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 15137cfd6d..74e2e78b29 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -67,9 +67,13 @@ Python build system, but are not Python modules, can freely choose
 their name (existing examples in Buildroot are +scons+ and
 +supervisor+).
 
-In their +Config.in+ file, they should depend on +BR2_PACKAGE_PYTHON+
-so that when Buildroot will enable Python 3 usage for modules, we will
-be able to enable Python modules progressively on Python 3.
+Packages that are only compatible with one version of Python (as in:
+Python 2 or Python 3) should depend on that version explicitely in
+their +Config.in+ file (+BR2_PACKAGE_PYTHON+ for Python 2,
++BR2_PACKAGE_PYTHON3+ for Python 3).  Packages that are compatible
+with both versions should not explicitely depend on them in their
++Config.in+ file, since that condition is already expressed for the
+whole "External python modules" menu.
 
 The main macro of the Python package infrastructure is
 +python-package+. It is similar to the +generic-package+ macro. It is
