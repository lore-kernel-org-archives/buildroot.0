From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 21:04:04 -0700
Subject: [Buildroot] [PATCH 1/2] package/gensio: bump to version 2.2.0
Message-ID: <20201123040405.2196833-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch backported from upstream to fix:
sctp: Fix a compile problem when disabled

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Fix-a-compile-problem-when-disabled.patch | 31 +++++++++++++++++++
 package/gensio/gensio.hash                    |  6 ++--
 package/gensio/gensio.mk                      |  2 +-
 3 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch

diff --git a/package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch b/package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch
new file mode 100644
index 0000000000..086093a79b
--- /dev/null
+++ b/package/gensio/0001-sctp-Fix-a-compile-problem-when-disabled.patch
@@ -0,0 +1,31 @@
+From 28e869876525479b98d0c473b47b176b98fc27be Mon Sep 17 00:00:00 2001
+From: Corey Minyard <cminyard@mvista.com>
+Date: Sat, 31 Oct 2020 13:32:23 -0500
+Subject: [PATCH] sctp: Fix a compile problem when disabled
+
+Changing the disabled code was missed :(.
+
+Signed-off-by: Corey Minyard <cminyard@mvista.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+28e869876525479b98d0c473b47b176b98fc27be]
+---
+ lib/gensio_sctp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gensio_sctp.c b/lib/gensio_sctp.c
+index bd9437f..4278ff8 100644
+--- a/lib/gensio_sctp.c
++++ b/lib/gensio_sctp.c
+@@ -1092,7 +1092,7 @@ str_to_sctp_gensio_accepter(const char *str, const char * const args[],
+ #else
+ 
+ int
+-sctp_gensio_alloc(struct gensio_addr *iai, const char * const args[],
++sctp_gensio_alloc(const struct gensio_addr *iai, const char * const args[],
+ 		  struct gensio_os_funcs *o,
+ 		  gensio_event cb, void *user_data,
+ 		  struct gensio **new_gensio)
+-- 
+2.25.1
+
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index ecf9d5e159..7389cd1c9c 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  bef0312c68ef541f85893c6bc85930ed  gensio-2.1.5.tar.gz
-sha1  f23b4017aba5a6f9066f734ffb600fa36b1399c0  gensio-2.1.5.tar.gz
+md5  580c969c150effa9e53be70544b7ae9e  gensio-2.2.0.tar.gz
+sha1  23f9211b9b91325ac6ba64d038c978d483fb93cb  gensio-2.2.0.tar.gz
 # Locally computed:
-sha256  e497043a0415177652bfb2b1d045e4605cd5726bbcfe790ef6f555ac25825c12  gensio-2.1.5.tar.gz
+sha256  006ce4e1fa0786b1abfa18f675cd92f98558f612e6fde6fac8bd5a1e61b5e1c9  gensio-2.2.0.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 1170ec00f4..74aa827324 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.1.5
+GENSIO_VERSION = 2.2.0
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.25.1
