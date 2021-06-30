From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 30 Jun 2021 10:36:58 -0700
Subject: [Buildroot] [PATCH v2 3/5] package/nginx-naxsi: bump version to 1.3
In-Reply-To: <20210630173700.30975-1-aduskett@gmail.com>
References: <20210630173700.30975-1-aduskett@gmail.com>
Message-ID: <20210630173700.30975-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
  - Change license to GPL-3.0 and BSD-3c
  - Change license file to LICENSE and naxsi_src/ext/libinjection/COPYING
  - Update license hash's in nginx-naxsi.hash

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Add pcre as a dependency (Yann)
  - Add naxsi_src/ext/libinjection/COPYING license file (Yann)
  - Drop "with OpenSSL exception" (yann)

 package/nginx-naxsi/nginx-naxsi.hash | 5 +++--
 package/nginx-naxsi/nginx-naxsi.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 1f289c56cd..4712ede2af 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4	nginx-naxsi-0.56.tar.gz
-sha256	046812ddc8f250f85b5d6e04218c185849c618b309271ef9d8b01e92c6f7a6ac	naxsi_src/naxsi_json.c
+sha256  439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628  nginx-naxsi-1.3.tar.gz
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
+sha256  d0732bc23658db5b9749e3f9cd4fe0f9b3e132b5955adccb08821845fe2a21c8  naxsi_src/ext/libinjection/COPYING
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 7cfa94a5d4..c599ebf3be 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.56
+NGINX_NAXSI_VERSION = 1.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
-NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
-NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+NGINX_NAXSI_LICENSE = GPL-3.0 BSD-3c
+NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING
+NGINX_NAXSI_DEPENDENCIES = pcre
+
 
 $(eval $(generic-package))
-- 
2.31.1
