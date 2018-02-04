From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Feb 2018 00:16:00 +0100
Subject: [Buildroot] [PATCH] package/bootstrap: fix licence file path
Message-ID: <20180204231600.22452-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The licence file is in css/ directory.

Fixes:
http://autobuild.buildroot.net/results/0d4/0d4b9488d1aa80e8d290e4dfe1937c3879eceea4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/bootstrap/bootstrap.hash | 2 +-
 package/bootstrap/bootstrap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index 6bf6e5218c..32ef9c4bbb 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256	fa1caaaf640c32c553d0b323da1036f2232703d64a1d22c3a2ec84ace68c791a	bootstrap-4.0.0-dist.zip
-sha256	8c1a4c25634d5841924aab1848acc9dcbc3d5672183053c8b71ff2139b65d7c3	bootstrap.css
+sha256	8c1a4c25634d5841924aab1848acc9dcbc3d5672183053c8b71ff2139b65d7c3	css/bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index aac457c190..61d6c826fc 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -8,7 +8,7 @@ BOOTSTRAP_VERSION = 4.0.0
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
-BOOTSTRAP_LICENSE_FILES = bootstrap.css
+BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
-- 
2.14.3
