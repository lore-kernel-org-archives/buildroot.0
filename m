From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Feb 2020 22:21:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongoose: security bump to version
 6.17
Message-ID: <20200212212134.1573180-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-19307: An integer overflow in parse_mqtt in mongoose.c in
  Cesanta Mongoose 6.16 allows an attacker to achieve remote DoS
  (infinite loop), or possibly cause an out-of-bounds write, by sending
  a crafted MQTT protocol packet.
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index d380131631..c5de11bec2 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	1f20f2781862560ddf3203dfb0e6fcf248a68bf92aefbeafb9d2a629c4767c02  mongoose-6.16.tar.gz
-sha256	fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
+sha256  5bff3cc70bb2248cf87d06a3543f120f3b29b9368d25a7715443cb10612987cc  mongoose-6.17.tar.gz
+sha256  fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index bb40de261e..7944f5e534 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.16
+MONGOOSE_VERSION = 6.17
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.24.1
