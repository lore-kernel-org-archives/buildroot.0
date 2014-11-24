From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:27:07 +0100
Subject: [Buildroot] [git commit] czmq: fix static build
Message-ID: <20141124212855.8F14E7FED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9201d558f0abe4e6a299287c926a795b28af6f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libstdc++ may also need -lm.

Fixes:
http://autobuild.buildroot.net/results/aab/aab80285c54641fd7c217cdd45c4593e5c3a66c5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/czmq/czmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 9a12726..25f67d5 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -19,7 +19,7 @@ CZMQ_LICENSE_FILES = LICENSE
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-CZMQ_CONF_OPTS += LIBS=-lstdc++
+CZMQ_CONF_OPTS += LIBS="-lstdc++ -lm"
 endif
 
 define CZMQ_CREATE_CONFIG_DIR
