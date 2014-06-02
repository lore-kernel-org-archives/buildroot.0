From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 23:15:47 +0200
Subject: [Buildroot] [git commit] package/weston: add support for libinput
Message-ID: <20140602211715.19AAE9CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73d1ca8dc544fa6187eb4539f0cd5353d51396f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ea63203..325cfc7 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -32,6 +32,13 @@ else
 WESTON_CONF_OPT += --disable-xkbcommon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+WESTON_DEPENDENCIES += libinput
+WESTON_CONF_OPT += --enable-libinput-backend
+else
+WESTON_CONF_OPT += --disable-libinput-backend
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
