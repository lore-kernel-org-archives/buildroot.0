From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:38:08 +0200
Subject: [Buildroot] [git commit] musl: honor static vs. shared library
	options
Message-ID: <20151015073826.A7F3080049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb41933d3642f44c8d2db07886b2e5bf18b97fad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use SHARED_STATIC_LIBS_OPTS to simplify the logic.]

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 22589f5..f0c45f5 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -28,7 +28,8 @@ define MUSL_CONFIGURE_CMDS
 			--host=$(GNU_TARGET_NAME) \
 			--prefix=/usr \
 			--libdir=/lib \
-			--disable-gcc-wrapper)
+			--disable-gcc-wrapper \
+			$(SHARED_STATIC_LIBS_OPTS))
 endef
 
 define MUSL_BUILD_CMDS
