From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 15:15:15 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-jinja2:
 security bump to version 2.11.3
Message-ID: <20210406125229.AA67882A52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fafa3cda2f3c6bb3affafbd069c97b3f4cfac656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issue:

- CVE-2020-28493: This affects the package jinja2 from 0.0.0 and before
  2.11.3.  The ReDoS vulnerability is mainly due to the `_punctuation_re
  regex` operator and its use of multiple wildcards.  The last wildcard is
  the most exploitable as it searches for trailing punctuation.  This issue
  can be mitigated by Markdown to format user content instead of the urlize
  filter, or by implementing request timeouts and limiting process memory.

  https://snyk.io/vuln/SNYK-PYTHON-JINJA2-1012994

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ff976939531f8fd0fa141d22b1299a56ec953c5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 package/python3-jinja2/python3-jinja2.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 21170a2a99..51590b17d2 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  0362203b22547abca06ed1082bc1e7b4  Jinja2-2.11.2.tar.gz
-sha256  89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0  Jinja2-2.11.2.tar.gz
+md5  231dc00d34afb2672c497713fa9cdaaa  Jinja2-2.11.3.tar.gz
+sha256  a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6  Jinja2-2.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 9b59d2b019..f91cac6937 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-jinja2/python3-jinja2.mk
-PYTHON_JINJA2_VERSION = 2.11.2
+PYTHON_JINJA2_VERSION = 2.11.3
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
index 851ee28b59..5d29e1d889 100644
--- a/package/python3-jinja2/python3-jinja2.mk
+++ b/package/python3-jinja2/python3-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON3_JINJA2_VERSION = 2.11.2
+PYTHON3_JINJA2_VERSION = 2.11.3
 PYTHON3_JINJA2_SOURCE = Jinja2-$(PYTHON3_JINJA2_VERSION).tar.gz
-PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/64/a7/45e11eebf2f15bf987c3bc11d37dcc838d9dc81250e67e4c5968f6008b6c
+PYTHON3_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
 PYTHON3_JINJA2_SETUP_TYPE = setuptools
 PYTHON3_JINJA2_LICENSE = BSD-3-Clause
 PYTHON3_JINJA2_LICENSE_FILES = LICENSE.rst
