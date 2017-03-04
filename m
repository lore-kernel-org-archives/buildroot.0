From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:40:13 +0100
Subject: [Buildroot] [git commit] Revert "python-pyasn: fix legal info"
Message-ID: <20170304104146.D5C1B819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe509c33cc9b3ecf09e738701d5d7277677ff8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit aca82a056b04f1bc1d2578e414d8a8d1eaf66207, which is
needed to revert commit 98c9b1bec6fd511889f38c72bc4aa5aba89e264d,
which itself causes build failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/python-pyasn.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 4fc091f..20b2630 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -7,8 +7,8 @@
 PYTHON_PYASN_VERSION = 1.6.0b1
 PYTHON_PYASN_SOURCE = pyasn-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/31/da/c8338545be0ee7a727c977113e75888e4f1f2b2e10f9284fdfa31dab29bc
-PYTHON_PYASN_LICENSE = MIT, BSD-4c (radix tree)
-PYTHON_PYASN_LICENSE_FILES = LICENSE
+PYTHON_PYASN_LICENSE = BSD-2c
+PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
