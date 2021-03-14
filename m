From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 14 Mar 2021 17:01:48 +0100
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version 7.2
Message-ID: <20210314160148.5425-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2021-26530: The mg_tls_init function in Cesanta Mongoose HTTPS server 7.0
  (compiled with OpenSSL support) is vulnerable to remote OOB write attack via
  connection request after exhausting memory pool.
- Fix CVE-2021-26529: The mg_tls_init function in Cesanta Mongoose HTTPS server 7.0
  and 6.7-6.18 (compiled with mbedTLS support) is vulnerable to remote OOB write
  attack via connection request after exhausting memory pool.
- Fix CVE-2021-26528: The mg_http_serve_file function in Cesanta Mongoose HTTP server
  7.0 is vulnerable to remote OOB write attack via connection request after exhausting
  memory pool.

See https://github.com/cesanta/mongoose/releases/tag/7.2

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index d9ed76c4ac..809f160cf0 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f099bf7223c527e1a0b7fc8888136a3992e8b5c7123839639213b9483bb4f95b  mongoose-7.1.tar.gz
+sha256  8c5024a4e5b5a0c7fdae3c24ebc68e2b3ccfaba08cf25c2e76fc7f14f92fd4a5  mongoose-7.2.tar.gz
 sha256  9553d057f2ba980642f2c18d87ed38896cff1c9612d77d684a73a11fe1443b05  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 0974c76446..2c5df1d0cc 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.1
+MONGOOSE_VERSION = 7.2
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.17.1
