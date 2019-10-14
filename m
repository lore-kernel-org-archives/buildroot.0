From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:14:26 +0200
Subject: [Buildroot] [git commit] package/python-setuptools-scm-git-archive:
 new package
Message-ID: <20191014201700.AA51D8DF3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9359325c6081df89ff57667cb49e0d12cd553b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is only needed for building Python packages, so
it's going to be compiled for host only.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-setuptools-scm-git-archive.hash                 |  5 +++++
 .../python-setuptools-scm-git-archive.mk                   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
new file mode 100644
index 0000000000..e4f169ed9d
--- /dev/null
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
+md5	1c9351fa5cebd12e76488737a7c78f2e  setuptools_scm_git_archive-1.1.tar.gz
+sha256	6026f61089b73fa1b5ee737e95314f41cb512609b393530385ed281d0b46c062  setuptools_scm_git_archive-1.1.tar.gz
+# Locally computed sha256 checksums
+sha256	89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
new file mode 100644
index 0000000000..1c18095f54
--- /dev/null
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-setuptools-scm-git-archive
+#
+################################################################################
+
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.1
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/7e/2c/0c15b29a1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
