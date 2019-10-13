From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 13 Oct 2019 18:11:51 +0200
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version 6.16
Message-ID: <1570983112-25650-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

CVE-2019-13503: mq_parse_http in mongoose.c in Mongoose 6.15
has a heap-based buffer over-read.

See https://github.com/cesanta/mongoose/releases/tag/6.16

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 92f35a7..d380131 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	ed9b44690f9660d25562e45472d486c086bcc916bf49f39f22e0a90444d44454  mongoose-6.15.tar.gz
+sha256	1f20f2781862560ddf3203dfb0e6fcf248a68bf92aefbeafb9d2a629c4767c02  mongoose-6.16.tar.gz
 sha256	fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index c4a703d..bb40de2 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.15
+MONGOOSE_VERSION = 6.16
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.7.4
