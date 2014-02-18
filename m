From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 23:29:34 +0100
Subject: [Buildroot] [git commit branch/next] python3: provide a PYTHON3_PATH
Message-ID: <20140219080355.870A399B3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb7667bf41d4ebb8a3de3c6bebdaadfa65ec775c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Python package infrastructure will need the Python 3 package to
provide a PYTHON3_PATH environment variable in order to build
third-party Python modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ad9b989..1bf8500 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -147,5 +147,8 @@ endef
 
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 
+# Provided to other packages
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
