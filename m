From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:12:35 +0200
Subject: [Buildroot] [git commit] package/uacme: fix c99 detection on !wchar
 toolchains
Message-ID: <20191005210706.BBD0E88F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27c7f30c4f443bc1bae2cc2ec6e68c76d42f9e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/f86584cc3066ab99f70a49d65dab9435135f4a9a/

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/uacme.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 999cc365e9..d3d692b1f8 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,6 +13,8 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
+UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
