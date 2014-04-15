From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:18:20 +0200
Subject: [Buildroot] [git commit] host-python-pyrex: use the
	HOST_*_NEEDS_HOST_PYTHON infrastructure
Message-ID: <20140415211825.8FB719BF84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=537ec1c3c88e4fb9f5ae9f9d2f1667a7b1ce2a60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pyrex does not support python3.

So, using the *_NEEDS_HOST_PYTHON infrastructure will make sure we won't try
building it for python3. Besides, it will automatically take care of adding the
right host-python package to the dependency list.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyrex/python-pyrex.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
index 73cb163..7f424ad 100644
--- a/package/python-pyrex/python-pyrex.mk
+++ b/package/python-pyrex/python-pyrex.mk
@@ -7,9 +7,9 @@
 PYTHON_PYREX_VERSION = 0.9.9
 PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
 PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
-PYTHON_PYREX_DEPENDENCIES = host-python
 PYTHON_PYREX_LICENSE = Apache-v2
 PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
 PYTHON_PYREX_SETUP_TYPE = distutils
+HOST_PYTHON_PYREX_NEEDS_HOST_PYTHON = python2
 
 $(eval $(host-python-package))
