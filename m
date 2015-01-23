From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Jan 2015 07:47:56 -0300
Subject: [Buildroot] [PATCH] patch: security bump to version 2.7.3
Message-ID: <1422010076-14647-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-1196 - allows remote attackers to write to arbitrary
files via a symlink attack in a patch file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/patch.hash | 2 ++
 package/patch/patch.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/patch/patch.hash

diff --git a/package/patch/patch.hash b/package/patch/patch.hash
new file mode 100644
index 0000000..7f1b024
--- /dev/null
+++ b/package/patch/patch.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d09022de9d629561bf4dad44625ef4b1ead15178b210412113531730cdb6f19d	patch-2.7.3.tar.xz
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 2dd4533..4fa0e41 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PATCH_VERSION = 2.7.1
+PATCH_VERSION = 2.7.3
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
-- 
2.0.5
