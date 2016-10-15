From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:40 +0200
Subject: [Buildroot] [git commit] arptables: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.058B581F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c60b11f00e3d64a441161a742a68725b535a44f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/arptables/arptables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index 4f101c7..888d396 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -10,7 +10,7 @@ ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arp
 ARPTABLES_LICENSE = GPLv2+
 
 define ARPTABLES_BUILD_CMDS
-	$(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" COPT_FLAGS="$(TARGET_CFLAGS)"
 endef
 
