From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Jun 2021 22:47:48 +0200
Subject: [Buildroot] [PATCH v1 3/4] package/libxmlrpc: bump version to
 1.58.02 (code/advanced@r3119)
In-Reply-To: <20210614204749.10693-1-ps.report@gmx.net>
References: <20210614204749.10693-1-ps.report@gmx.net>
Message-ID: <20210614204749.10693-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog ([1], [2]):

  - Build: fix bug: won't compile with --enable-libxml2, introduced with
    Release 1.44 (December 2015).

  - Build: update config.guess and config.sub so Configure can recognize
    newer environments.

  - Build: Fix link failure in several tools because they fail to link the
    Curl library. Don't know how long this was broken.

  - Build: Eliminate compiler warnings with GCC 6.3

  - Code cleanups - trailing white space, compile warnings

  - Abyss: fix bug: wild memory reference when server times out waiting for
    request header. Introduced with Release 1.44 (December 2015).

[1] http://xmlrpc-c.sourceforge.net/change.html
[2] http://xmlrpc-c.sourceforge.net/change_advanced.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 679098d8df..5d42dc0558 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08af4372ef92cd33ddfe0d68a351f3c5c0702e39bcdaa3263f2c249d5c3eda96  libxmlrpc-r3120-br2.tar.gz
+sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br2.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 2853edc2ce..833dca5065 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# 1.54.03 (code/stable at r3130)
-LIBXMLRPC_VERSION = r3120
-LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/stable
+# 1.58.02 (code/advanced at r3119)
+LIBXMLRPC_VERSION = r3119
+LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
 LIBXMLRPC_LICENSE_FILES = doc/COPYING
-- 
2.31.1
