From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:01 +0200
Subject: [Buildroot] [PATCH 08/20] Remove unneeded variables in
	HOST_CONFIGURE_OPTS
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8e8103bfb55a814d68eabb51afebfb35c3e7cec8.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building packages for the host, the *_FOR_BUILD and *_FOR_TARGET
variables are not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   26 --------------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8a04c37..3997a21 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -229,32 +229,6 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
 		CXX="$(HOSTCXX) $(HOST_CXXFLAGS)" \
 		CPP="$(HOSTCPP) $(HOST_CFLAGS)" \
-		AR_FOR_BUILD="$(HOSTAR)" \
-		AS_FOR_BUILD="$(HOSTAS)" \
-		CC_FOR_BUILD="$(HOSTCC)" \
-		GCC_FOR_BUILD="$(HOSTCC)" \
-		CXX_FOR_BUILD="$(HOSTCXX)" \
-		LD_FOR_BUILD="$(HOSTLD)" \
-		FC_FOR_BUILD="$(HOSTFC)" \
-		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
-		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
-		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
-		AR_FOR_TARGET="$(TARGET_AR)" \
-		AS_FOR_TARGET="$(TARGET_AS)" \
-		CC_FOR_TARGET="$(TARGET_CC)" \
-		LD_FOR_TARGET="$(TARGET_LD)" \
-		NM_FOR_TARGET="$(TARGET_NM)" \
-		RANLIB_FOR_TARGET="$(TARGET_RANLIB)" \
-		STRIP_FOR_TARGET="$(TARGET_STRIP)" \
-		OBJCOPY_FOR_TARGET="$(TARGET_OBJCOPY)" \
-		OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
-		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
-		DEFAULT_LINKER="$(TARGET_LD)" \
-		ORIGINAL_AS_FOR_TARGET="$(TARGET_AS)" \
-		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
-		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
-		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-- 
1.7.0.4
