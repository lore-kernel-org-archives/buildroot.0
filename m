From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed,  7 Nov 2012 16:01:20 +0100
Subject: [Buildroot] [PATCH 1/2] Give the path to the realdelf binary the
	the packages
In-Reply-To: <1352300481-825-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1352300481-825-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1352300481-825-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Makefile.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
