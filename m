From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:50 +0100
Subject: [Buildroot] [PATCHv1 01/26] python: expose PYTHON_PATH
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a preparation to make the Python infrastructure support both Python
and Python 3, as well as the bump of Python 2 and 3, we need the
Python package to expose the Python module path in a variable called
PYTHON_PATH. It will be used by the following commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 6187d66..f2e48c4 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -167,5 +167,8 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
 PYTHON_AUTORECONF = YES
 
+# Provided to other packages
+PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.3.2
