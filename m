From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:40:29 +0100
Subject: [Buildroot] [git commit branch/next] python: expose PYTHON_PATH
Message-ID: <20140214210327.5B3979CA1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64b4fa7b256ff9d1f2bf9a2f7e50fd5c9b9ef8bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As a preparation to make the Python infrastructure support both Python
and Python 3, as well as the bump of Python 2 and 3, we need the
Python package to expose the Python module path in a variable called
PYTHON_PATH. It will be used by the following commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
