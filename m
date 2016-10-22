From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] rt-tests: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.4DBF07F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=636faaa0c1aafbd4fe906280848a04c08c55fc0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
