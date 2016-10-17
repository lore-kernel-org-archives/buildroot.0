From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:35 -0300
Subject: [Buildroot] [PATCH 48/93] checkpolicy: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-49-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/checkpolicy/checkpolicy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index f1b76d0..a21b39e 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -17,11 +17,11 @@ HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
 
 # DESTDIR is used at build time to find host-libselinux
 define HOST_CHECKPOLICY_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
 endef
 
 define HOST_CHECKPOLICY_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.3
