From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 11:10:48 +0100
Subject: [Buildroot] [git commit] package/rt-tests: simplify PYLIB logic
Message-ID: <20200203095950.3290F8859C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7041b753dcf49080472bab75ad2e7a49272f6fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but improves readability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 431c017688..abc32f4fb2 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -25,7 +25,7 @@ define RT_TESTS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
-		$(if $(BR2_PACKAGE_PYTHON3),PYLIB=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/,PYLIB="") \
+		PYLIB="$(if $(BR2_PACKAGE_PYTHON3),/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/)" \
 		install
 endef
 
