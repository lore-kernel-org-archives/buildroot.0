From: Arnaud Aujon <arnaud.aujon@gmail.com>
Date: Sun, 17 Nov 2013 16:34:00 +0100
Subject: [Buildroot]  [PATCH]ttcp: fix url, rename patch
Message-ID: <1384702440-23840-1-git-send-email-arnaud.aujon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - fix download url : isn't available on previous ftp, use an other one instead
 - Add version according to source code version
 - rename and clean patch according to patch policy

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
---
 ...ttcp-bcopy.patch => ttcp-0001-replace-deprecated-bcopy.patch} | 9 ++++++---
 package/ttcp/ttcp.mk                                             | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename package/ttcp/{ttcp-bcopy.patch => ttcp-0001-replace-deprecated-bcopy.patch} (64%)

diff --git a/package/ttcp/ttcp-bcopy.patch b/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
similarity index 64%
rename from package/ttcp/ttcp-bcopy.patch
rename to package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
index c98c88f..fb8ef7f 100644
--- a/package/ttcp/ttcp-bcopy.patch
+++ b/package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch
@@ -1,6 +1,9 @@
-diff -urN ttcp-0rig/ttcp.c ttcp/ttcp.c
---- ttcp-0rig/ttcp.c	1993-05-17 00:00:00.000000000 +0200
-+++ ttcp/ttcp.c	2009-01-14 23:46:19.000000000 +0100
+Replace deprecated bcopy call by using memmove instead.
+
+Index: b/ttcp.c
+===================================================================
+--- a/ttcp.c
++++ b/ttcp.c
 @@ -241,7 +241,7 @@
  			if ((addr=gethostbyname(host)) == NULL)
  				err("bad hostname");
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index b65949d..a30e2ac 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 #
-TTCP_VERSION =
-TTCP_SITE    = http://ftp.sunet.se/pub/network/monitoring/ttcp
+TTCP_VERSION = 1.12
+TTCP_SITE    = ftp://ftp.sgi.com/sgi/src/ttcp/
 TTCP_SOURCE  = ttcp.c
 TTCP_LICENSE = public domain
 
-- 
1.8.3.1
