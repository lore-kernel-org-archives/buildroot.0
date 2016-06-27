From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jun 2016 19:59:26 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.6.1
Message-ID: <1467068366-28090-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And since we switched to non-gnu mirror better use the small xz tarball.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 7152f52..a07a969 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d517a5fcaa9fa6ceda8a63e22be1d83dd7f4af13703c73b10a48e95a6e1178d3  nano-2.6.0.tar.gz
+sha256 45721fa6d6128068895ad71a6967ff7398d11b064b3f888e5073c97a2b6e9a81  nano-2.6.1.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index d8e19bc..f01745d 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.6
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
+NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
 NANO_CONF_OPTS = \
-- 
2.7.3
