From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 10:06:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-jedi: add
 missing license
Message-ID: <20200508080227.8D5D990FE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=279eddff6515c00e9633342895684f7540c365a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

python-jedi bundles its own copy of typeshed since version 0.14.0 and
https://github.com/davidhalter/jedi/commit/7d2b7bb3c1c4f79f325ccbde9d2b2734aa872312

So add it to the license files (and update indentation of hash file to
two spaces while at it)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab98c1ffb65b10ede668356014481f63ac9a72e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jedi/python-jedi.hash | 9 +++++----
 package/python-jedi/python-jedi.mk   | 5 +++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 1fc3a3da50..77af6e79f3 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5	ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
-sha256	ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e  jedi-0.15.1.tar.gz
+md5  ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
+sha256  ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e  jedi-0.15.1.tar.gz
 # Locally computed sha256 checksums
-sha256	78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
-sha256	9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
+sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
+sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
+sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0  jedi/third_party/typeshed/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index e11146def7..4e756a709c 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -8,7 +8,8 @@ PYTHON_JEDI_VERSION = 0.15.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
 PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/85/03/cd5a6e44a5753b4d539288d9d1f9645caac889c17dd2950292a8818f86b2
 PYTHON_JEDI_SETUP_TYPE = setuptools
-PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme)
-PYTHON_JEDI_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE
+PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme), Apache-2.0 (typeshed)
+PYTHON_JEDI_LICENSE_FILES = \
+	LICENSE.txt docs/_themes/flask/LICENSE jedi/third_party/typeshed/LICENSE
 
 $(eval $(python-package))
