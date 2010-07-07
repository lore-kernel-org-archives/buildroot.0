From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:02 +0200
Subject: [Buildroot] [PATCH 09/20] Separate flags from commands in
	HOST_CONFIGURE_OPTS
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b07030a708293756e25edd6432ed02cc53ff758e.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just as we did for LD/LDFLAGS, pass CFLAGS and CXXFLAGS in their own
variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3997a21..734af03 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -225,10 +225,12 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD)" \
 		NM="$(HOSTNM)" \
-		CC="$(HOSTCC) $(HOST_CFLAGS)" \
-		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
-		CXX="$(HOSTCXX) $(HOST_CXXFLAGS)" \
-		CPP="$(HOSTCPP) $(HOST_CFLAGS)" \
+		CC="$(HOSTCC)" \
+		GCC="$(HOSTCC)" \
+		CXX="$(HOSTCXX)" \
+		CPP="$(HOSTCPP)" \
+		CFLAGS="$(HOST_CFLAGS)" \
+		CXXFLAGS="$(HOST_CXXFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-- 
1.7.0.4
