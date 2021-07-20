From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:56:03 +0200
Subject: [Buildroot] [git commit] package/nginx-naxsi: bump version to 1.3
Message-ID: <20210720212230.A5420838D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=3335c8d8685119ebb5b2a9a6e575f3a5337c4d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Change license to GPL-3.0 and BSD-3-Clause
  - Change license file to LICENSE and naxsi_src/ext/libinjection/COPYING
  - Update license hash's in nginx-naxsi.hash

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 5 +++--
 package/nginx-naxsi/nginx-naxsi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

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
index 7cfa94a5d4..2dba8ad589 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.56
+NGINX_NAXSI_VERSION = 1.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
-NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
-NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+NGINX_NAXSI_LICENSE = GPL-3.0, BSD-3-Clause (libinjection)
+NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING
 
 $(eval $(generic-package))
