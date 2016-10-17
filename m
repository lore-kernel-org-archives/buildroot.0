From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:53 -0300
Subject: [Buildroot] [PATCH 06/93] ed: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-7-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ed/ed.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index f3bcb74..36f2f2e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -14,18 +14,18 @@ ED_LICENSE_FILES = COPYING
 
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
-		./configure \
+		$(TARGET_MAKE_ENV) ./configure \
 		--prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) \
 	)
 endef
 
 define ED_BUILD_CMDS
-	$(MAKE)	-C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define ED_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
