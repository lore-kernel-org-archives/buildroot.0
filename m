From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:03:10 +0200
Subject: [Buildroot] [git commit] python3: correctly fix PYTHON3_PATH
Message-ID: <20140412210411.9C49C9C749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97fba4cd24db0824997cb6685eae875effd76395
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6251ccf03254f832c6e6ba0203ad46c18f217ca9 ('python3: fix the
value of PYTHON3_PATH') tried to fix the value of PYTHON3_PATH, but
did it incorrectly: it changed PYTHON_VERSION_MAJOR to
PYTHON_VERSION3_MAJOR, while it should have been
PYTHON3_VERSION_MAJOR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8c5024b..80ad88e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -169,7 +169,7 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION3_MAJOR)/site-packages/
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
