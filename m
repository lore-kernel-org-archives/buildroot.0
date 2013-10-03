From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed,  2 Oct 2013 22:10:26 -0400
Subject: [Buildroot] [PATCH] python-pyparsing: fix _python_srcdir
Message-ID: <1380766226-2482-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous expression for _python_srcdir forgot the dash
between "python" and the version, so the path was actually
non-existent.  Change the expression to "$(PYTHON_DIR)", which
is simpler, and matches python-crc16 and python-pyzmq.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

I don't actually know if _python_srcdir needs to be there, but
if it's there, then it shouldn't point to an invalid location.
---
 package/python-pyparsing/python-pyparsing.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 7814ce3..70a7e3b 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -20,7 +20,7 @@ define PYTHON_PYPARSING_BUILD_CMDS
 	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
 	 CROSS_COMPILING=yes                                    \
 	 _python_sysroot=$(STAGING_DIR)                         \
-	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
+	 _python_srcdir=$(PYTHON_DIR)                           \
 	 _python_prefix=/usr                                    \
 	 _python_exec_prefix=/usr                               \
 	 $(HOST_DIR)/usr/bin/python setup.py build              \
-- 
1.7.9.5
