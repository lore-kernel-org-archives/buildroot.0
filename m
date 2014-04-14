From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Apr 2014 00:09:49 +0200
Subject: [Buildroot] [PATCH v2 3/3] host-python-pyrex: use the
	HOST_*_NEEDS_HOST_PYTHON infrastructure
In-Reply-To: <1397513389-16252-1-git-send-email-s.martin49@gmail.com>
References: <1397513389-16252-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1397513389-16252-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pyrex does not support python3.

So, using the *_NEEDS_HOST_PYTHON infrastructure will make sure we won't try
building it for python3. Besides, it will automatically take care of adding the
right host-python package to the dependency list.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
- update commit log (ThomasP)
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
