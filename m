From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] turbolua: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.9E6C780335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fd8cde1ffb43e38cdacc2f349224edfa1afdd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/turbolua/turbolua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index bf6d491..bf9e27f 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -22,11 +22,11 @@ TURBOLUA_MAKE_OPTS += SSL=none
 endif
 
 define TURBOLUA_BUILD_CMDS
-	$(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
 endef
 
 define TURBOLUA_INSTALL_TARGET_CMDS
-	$(MAKE) $(TURBOLUA_MAKE_OPTS) LDCONFIG=true \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TURBOLUA_MAKE_OPTS) LDCONFIG=true \
 		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
