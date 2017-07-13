From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 19:27:27 +0200
Subject: [Buildroot] [git commit] python-twisted: add missing dependency on
	host-python-incremental
Message-ID: <20170713172442.8AF2F82133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38aef10ee715edb213a6b61c9d19fc74d4e5f1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent change on PYTHONPATH for Python 2.x has revealed a missing
dependency in the python-twisted package. The incremental Python
module is listed in both setup_requires and install_requires, so we
must depend on both its target *and* host variants.

Fixes:

  http://autobuild.buildroot.net/results/386bf87abba550b5477d5e15e57981b8c3cef8d6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-twisted/python-twisted.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index b167a0f..9b3ced5 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -10,6 +10,6 @@ PYTHON_TWISTED_SITE = https://pypi.python.org/packages/d2/5d/ed5071740be94da6255
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-PYTHON_TWISTED_DEPENDENCIES = python-incremental
+PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental
 
 $(eval $(python-package))
