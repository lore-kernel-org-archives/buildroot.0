From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Apr 2014 00:58:01 +0200
Subject: [Buildroot] [git commit] kmod: python support works with python 3.x
	as well
Message-ID: <20140411225827.AD4F99C6D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f049a8a877ac03365165c8717bbfc807ae158ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 3987407..7cc2d65 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -32,8 +32,8 @@ KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPT += --with-xz
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-KMOD_DEPENDENCIES += python
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 KMOD_CONF_OPT += --enable-python
 endif
 
