From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:41:18 +0100
Subject: [Buildroot] [git commit] package/mongoose: security bump to version
 7.1
Message-ID: <20210216192158.204B07FA2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baef15dffa7aa9516491e1d24f7e073726745077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-26528: The mg_http_serve_file function in Cesanta
  Mongoose HTTP server 7.0 is vulnerable to remote OOB write attack via
  connection request after exhausting memory pool.
- Fix CVE-2021-26529: The mg_tls_init function in Cesanta Mongoose HTTPS
  server 7.0 and 6.7-6.18 (compiled with mbedTLS support) is vulnerable
  to remote OOB write attack via connection request after exhausting
  memory pool.
- Fix CVE-2021-26530: The mg_tls_init function in Cesanta Mongoose HTTPS
  server 7.0 (compiled with OpenSSL support) is vulnerable to remote OOB
  write attack via connection request after exhausting memory pool.

https://github.com/cesanta/mongoose/releases/tag/7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 149c0f5866..d9ed76c4ac 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  28206185873b5c448765f56e54d86a7af5a856b0b5f241aa44ac94bf34af7eee  mongoose-7.0.tar.gz
+sha256  f099bf7223c527e1a0b7fc8888136a3992e8b5c7123839639213b9483bb4f95b  mongoose-7.1.tar.gz
 sha256  9553d057f2ba980642f2c18d87ed38896cff1c9612d77d684a73a11fe1443b05  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 996cbff757..5c331cf48e 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.0
+MONGOOSE_VERSION = 7.1
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
