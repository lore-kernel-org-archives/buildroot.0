From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:33 -0300
Subject: [Buildroot] [PATCH 46/93] rt-tests: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-47-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/rt-tests/rt-tests.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 19f1021..addc15e 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -15,14 +15,14 @@ RT_TESTS_DEPENDENCIES = python
 endif
 
 define RT_TESTS_BUILD_CMDS
-	$(MAKE) -C $(@D) 			\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)	\
 		CC="$(TARGET_CC)" 		\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		prefix=/usr
 endef
 
 define RT_TESTS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) 				\
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)		\
 		DESTDIR="$(TARGET_DIR)" 		\
 		prefix=/usr 				\
 		$(if $(BR2_PACKAGE_PYTHON),PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/,PYLIB="") \
-- 
2.7.3
