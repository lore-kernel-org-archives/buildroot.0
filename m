From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:02 +0100
Subject: [Buildroot] [PATCH v2 09/20] python3: provide a PYTHON3_PATH
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Python package infrastructure will need the Python 3 package to
provide a PYTHON3_PATH environment variable in order to build
third-party Python modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 232862a..8bf9518 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -156,5 +156,8 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += \
 	HOST_PYTHON3_INSTALL_SYMLINK \
 	HOST_PYTHON3_INSTALL_CONFIG_SYMLINK
 
+# Provided to other packages
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
