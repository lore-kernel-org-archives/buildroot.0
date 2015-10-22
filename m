From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 23:43:52 +0200
Subject: [Buildroot] [git commit] iproute2: drop dead tipc disabling code
Message-ID: <20151022214501.1A1338191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ad133b5169cef7f7463cfe2022033d756bc7da0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since it's automatic via libmnl being present it's just dead code that's
not defined any longer, so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d1aa6bf..6660eb2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -54,7 +54,6 @@ define IPROUTE2_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
-	$(IPROUTE2_DISABLE_TIPC)
 endef
 
 define IPROUTE2_BUILD_CMDS
