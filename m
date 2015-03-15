From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 15 Mar 2015 23:09:52 +0100
Subject: [Buildroot] [PATCH 1/1] python-cheetah: fix python host dependency
Message-ID: <1426457392-22585-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

python-cheetah can't be used with python3. host-python-cheetah has the same
limitation.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-cheetah/python-cheetah.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 7354190..af7d1f5 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -10,6 +10,8 @@ PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
 
+HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON = python2
+
 # The dependency on host-python-markdown is needed to prevent
 # setuptools from downloading markdown if it is not installed yet.
 HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown
-- 
2.0.5
