From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:07 +0200
Subject: [Buildroot] [git commit] open2300: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.9216081F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddf4a30ecb3680f5aae2a166d6b94c749952967d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/open2300/open2300.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 323f566..588692d 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -28,7 +28,7 @@ endif
 endif
 
 define OPEN2300_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
 		CFLAGS="$(OPEN2300_CFLAGS)" CC_LDFLAGS="$(OPEN2300_LDFLAGS)" \
 		-C $(@D) $(OPEN2300_BINS)
 endef
