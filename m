From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] tekui: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.3B6AC819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c842b72e10602e31a14dbfbeb1f23fd6db5239ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tekui/tekui.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 60b48e0..f9ae849 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -56,11 +56,11 @@ endif
 endif
 
 define TEKUI_BUILD_CMDS
-	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
 endef
 
 define TEKUI_INSTALL_TARGET_CMDS
-	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
