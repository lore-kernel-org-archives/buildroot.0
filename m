From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:50:44 +0100
Subject: [Buildroot] [git commit] libv4l: drop -lrt workaround
Message-ID: <20170320205048.D2414825E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c5ade99fd2e34132c89c0fc6478a004fd959982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libv4l adds the -lrt flag since upstream commit 3dcb945bfcab
("v4l2-compliance: Explicitely link against rt library").

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/libv4l.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 4fec14f..c14bedb 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -53,8 +53,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
-# clock_gettime is used, which is provided by librt for glibc < 2.17
-LIBV4L_LIBS += -lrt
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LIBV4L_DEPENDENCIES += gettext
 endif
