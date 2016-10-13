From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:52 -0300
Subject: [Buildroot] [PATCH 45/51] libtommath: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-46-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libtommath/libtommath.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index eb3b00e..2fc8c39 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -13,11 +13,11 @@ LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
 define LIBTOMMATH_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
