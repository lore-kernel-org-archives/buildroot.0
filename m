From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 16:35:59 +0200
Subject: [Buildroot] [git commit] bootstrap: bump to version 4.1.0
Message-ID: <20180420143629.AFAE88271F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31b207a5db0fa8482be64da3b434ed575ab583b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also install bootstrap.min.css.map as it is referenced from
bootstrap.min.css.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bootstrap/bootstrap.hash | 4 ++--
 package/bootstrap/bootstrap.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index 32ef9c4bbb..ed29f9c529 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	fa1caaaf640c32c553d0b323da1036f2232703d64a1d22c3a2ec84ace68c791a	bootstrap-4.0.0-dist.zip
-sha256	8c1a4c25634d5841924aab1848acc9dcbc3d5672183053c8b71ff2139b65d7c3	css/bootstrap.css
+sha256	75c0325fd82e29cf524e28d8be7716c216cc507ba85b087ab36868209236aa01  bootstrap-4.1.0-dist.zip
+sha256	0ce7fbe215cdf921ed87d00a374404681d5d24898589a7fe60e068d09289b4ba  css/bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 005dd9a714..0699485f52 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 4.0.0
+BOOTSTRAP_VERSION = 4.1.0
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
@@ -17,6 +17,8 @@ endef
 define BOOTSTRAP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
+	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css.map \
+		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css.map
 	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.min.js \
 		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
 endef
