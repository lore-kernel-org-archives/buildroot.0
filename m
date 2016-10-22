From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] qtuio: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132039.8611E7F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b163c3267c6b8c83faff18de8afaf5ad84c73604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qtuio/qtuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 5fa10a7..6238b50 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -32,7 +32,7 @@ endef
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_BUILD_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		$(MAKE) -C $(@D)/examples/$${example} || exit 1; \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/examples/$${example} || exit 1; \
 	done
 endef
 endif
