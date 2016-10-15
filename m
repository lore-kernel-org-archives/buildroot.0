From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:44 +0200
Subject: [Buildroot] [git commit] mtdev2tuio: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.49F4481F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7ffe7e681a907d43eea66be08d6df85ae3f4634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtdev2tuio/mtdev2tuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 7b00221..d2e7040 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -13,7 +13,7 @@ MTDEV2TUIO_LICENSE_FILES = COPYING
 # mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
 # here. Liblo uses log(3), so we need to link with -lm
 define MTDEV2TUIO_BUILD_CMDS
-	$(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CC)" \
 		LIBS="-lmtdev -llo -lm" \
