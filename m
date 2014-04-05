From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 17:38:26 +0200
Subject: [Buildroot] [git commit] python3: fix the value of PYTHON3_PATH
Message-ID: <20140405153937.D70719C58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6251ccf03254f832c6e6ba0203ad46c18f217ca9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PYTHON3_PATH was incorrectly referencing the site-packages of
Python 2 packages, due to the usage of PYTHON_VERSION_MAJOR, instead
of PYTHON3_VERSION_MAJOR. This commit fixes that by using the correct
variable, which in our testing fixed the build of python-pyasn against
python3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 542f2c9..8c5024b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -169,7 +169,7 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION3_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
