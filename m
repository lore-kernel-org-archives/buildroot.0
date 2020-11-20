From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Nov 2020 18:18:30 +0100
Subject: [Buildroot] [git commit] package/python-flask-cors: security bump
 to version 3.0.9
Message-ID: <20201120170446.5C94C86CE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c356b20ba8afa79b08fc3d30a1c3f60d9f3c6f65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2020-25032: An issue was discovered in Flask-CORS (aka CORS Middleware
  for Flask) before 3.0.9.  It allows ../ directory traversal to access
  private resources because resource matching does not ensure that pathnames
  are in a canonical format.

Also drop outdated md5 checksum and fix .hash indentation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask-cors/python-flask-cors.hash | 7 +++----
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index a893b7c890..15b7d41a32 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5	551cc4c0305a171d28caa2b3bc838867  Flask-Cors-3.0.8.tar.gz
-sha256	72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16  Flask-Cors-3.0.8.tar.gz
+# sha256 from https://pypi.org/pypi/flask-cors/json
+sha256  6bcfc100288c5d1bcb1dbb854babd59beee622ffd321e444b05f24d6d58466b8  Flask-Cors-3.0.9.tar.gz
 # Locally computed sha256 checksums
-sha256	6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
+sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 60454e27c4..d712109002 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 3.0.8
+PYTHON_FLASK_CORS_VERSION = 3.0.9
 PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/9e/11/ca8b95c5bf9644471601e425f0de8cbd09a506bb6c24842cb17a6cd1eea8
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/99/fc/cd117ea122e28037a5ec60356a7ffae8b77af527713f7b5e4eb63089f669
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
