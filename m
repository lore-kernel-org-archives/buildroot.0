From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 23:35:39 +0100
Subject: [Buildroot] [git commit] TARGET_CONFIGURE_OPTS: pass READELF
Message-ID: <20121107231055.9205699C3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a32fa707e5d79c92908bb81142b00afe81a3e3e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Give the path to the realdelf binary for the target, similar to how we
do for the other tools.

[Peter: reworded]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a939882..9fdc745 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -113,6 +113,7 @@ TARGET_FC       = $(TARGET_CROSS)gfortran
 TARGET_LD       = $(TARGET_CROSS)ld
 TARGET_NM       = $(TARGET_CROSS)nm
 TARGET_RANLIB   = $(TARGET_CROSS)ranlib
+TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
@@ -170,6 +171,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		CXX="$(TARGET_CXX)" \
 		FC="$(TARGET_FC)" \
 		RANLIB="$(TARGET_RANLIB)" \
+		READELF="$(TARGET_READELF)" \
 		STRIP="$(TARGET_STRIP)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
 		OBJDUMP="$(TARGET_OBJDUMP)" \
