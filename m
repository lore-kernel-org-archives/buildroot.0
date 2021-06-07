From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:00 -0000
Subject: [Buildroot] [git commit] package/abootimg: Update to 1ebeb39,
 switch to ajs124
Message-ID: <20210607144654.B152081191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d770ad74b16fc2ef5f57e75d2c42b33030f46f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ajs124 [1] has 2 fixes over than original [2].

[1] https://gitlab.com/ajs124/abootimg
[2] https://github.com/ggrandou/abootimg.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr: also change homepage in Config.in]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/abootimg/Config.in     | 2 +-
 package/abootimg/abootimg.hash | 2 +-
 package/abootimg/abootimg.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/abootimg/Config.in b/package/abootimg/Config.in
index 30e5bd1fb0..bcd2a082c9 100644
--- a/package/abootimg/Config.in
+++ b/package/abootimg/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_ABOOTIMG
 	  Tool to manipulate Android Boot Images, either on files
 	  or directly on /dev block devices.
 
-	  https://github.com/ggrandou/abootimg
+	  https://gitlab.com/ajs124/abootimg
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
index fa5282c6c3..141db26860 100644
--- a/package/abootimg/abootimg.hash
+++ b/package/abootimg/abootimg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	eb8d912bc7b5454c2afd3385fd86f4917d3587c48a6f5ae45df7856d88502cab	abootimg-7e127fee6a3981f6b0a50ce9910267cd501e09d4.tar.gz
+sha256	f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37	abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br1.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSE
diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index ab6c709318..a07100df5a 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ABOOTIMG_VERSION = 7e127fee6a3981f6b0a50ce9910267cd501e09d4
-ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
+ABOOTIMG_VERSION = 1ebeb393252ab5aeed62e34bc439b6728444f06e
+ABOOTIMG_SITE = https://gitlab.com/ajs124/abootimg.git
+ABOOTIMG_SITE_METHOD = git
 ABOOTIMG_LICENSE = GPL-2.0+
 ABOOTIMG_LICENSE_FILES = LICENSE
 
