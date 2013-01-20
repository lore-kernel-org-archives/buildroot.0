From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:30:26 +0100
Subject: [Buildroot] [git commit] python3: Point /usr/bin/python to python3
	if python is not selected
Message-ID: <20130120203919.D06FF9A4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9976b37f86b03007efad8bb73e0fbd42e17add35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #5702

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/python3.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index bcd83ea..0d54162 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -148,5 +148,12 @@ PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
 
 PYTHON3_AUTORECONF = YES
 
+define PYTHON3_INSTALL_SYMLINK
+	ln -fs python3 $(TARGET_DIR)/usr/bin/python
+endef
+
+ifneq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
+endif
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
