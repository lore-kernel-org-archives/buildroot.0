From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 13:27:27 -0300
Subject: [Buildroot] [PATCH] gettext: bump to version 0.19.3
Message-ID: <1413476847-3631-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file, switch to xz tarball.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.hash | 3 +++
 package/gettext/gettext.mk   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/gettext/gettext.hash

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
new file mode 100644
index 0000000..d93eba1
--- /dev/null
+++ b/package/gettext/gettext.hash
@@ -0,0 +1,3 @@
+# From http://lists.gnu.org/archive/html/bug-gettext/2014-10/msg00025.html
+md5	092c3f460553ceb4a638ff81d36434c4	gettext-0.19.3.tar.xz
+sha1	5c8e37c5275742b6acc1257e2df9b5d1874c12e3	gettext-0.19.3.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 6932315..2b7b4f2 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.2
+GETTEXT_VERSION = 0.19.3
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
+GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
-- 
2.0.4
