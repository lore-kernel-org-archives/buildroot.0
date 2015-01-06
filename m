From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 09:30:02 -0300
Subject: [Buildroot] [PATCH] poppler: security bump to version 0.24.5
Message-ID: <1420547402-17213-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-7296 - JBIG2Stream::readSegments()" Denial of Service
Vulnerability.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/poppler/poppler.hash | 2 ++
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/poppler/poppler.hash

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
new file mode 100644
index 0000000..f3225bc
--- /dev/null
+++ b/package/poppler/poppler.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84	poppler-0.24.5.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a972325..2ac7e64 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.24.4
+POPPLER_VERSION = 0.24.5
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
-- 
2.0.5
