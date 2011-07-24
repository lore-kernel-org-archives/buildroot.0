From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Jul 2011 23:11:17 +0200
Subject: [Buildroot] [git commit] iproute2: fixup CCOPTS to unbreak build
Message-ID: <20110724211847.53AD78B491@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba930bbc19fee322572bf804b8d4c3a487adbdc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CCOPTS is also used for HOSTCC in the netem/ directory which contains
host tools so just ditch it there to avoid extra non-native
optimizations to sweep by.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index bafb8c0..0e6a431 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -34,6 +34,7 @@ define IPROUTE2_CONFIGURE_CMDS
 endef
 
 define IPROUTE2_BUILD_CMDS
+	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
 	$(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
-- 
1.7.3.4
