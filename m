From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 23:12:54 +0100
Subject: [Buildroot] [git commit] package/open62541: fix library version
 definition
Message-ID: <20210220215113.879C681605@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c5caa8f437a5a5355018b001c6d395a894286c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Manually specified version must start with letter 'v',
otherwise, the generated version macro will be zero
in the <build_dir>/src_generated/open62541/config.h file:
  #define UA_OPEN62541_VER_MAJOR 0
  #define UA_OPEN62541_VER_MINOR 0
  #define UA_OPEN62541_VER_PATCH 0

Reference from the following link:
https://open62541.org/doc/current/building.html

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/open62541/open62541.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 5a9f27562a..102e09a429 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -19,7 +19,7 @@ OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
-	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
+	-DOPEN62541_VERSION=v$(OPEN62541_VERSION) \
 	-DUA_ENABLE_HARDENING=OFF
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
