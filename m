From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 23:05:51 +0200
Subject: [Buildroot] [PATCH 4/5] host-python-pyrex: use the
	HOST_*_NEEDS_HOST_PYTHON infrastructure
In-Reply-To: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1397509552-5278-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will automatically take care of adding the right host-python package
to the dependency list and it will avoid trying to build python-pyrex using
python3.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python-pyrex/python-pyrex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.2
