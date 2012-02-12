From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Feb 2012 20:29:50 +0100
Subject: [Buildroot] [git commit] libecore: fix directfb dependency
Message-ID: <20120212195611.49E6D90A4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=718e1ecf5fb8f509c0cf9e7498ce7250470c3456
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libecore/libecore.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 0088480..5bc6532 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -20,13 +20,13 @@ LIBECORE_CONF_OPT = --disable-simple-x11
 # libecore
 ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
 LIBECORE_CONF_OPT += --enable-ecore-directfb
+LIBECORE_DEPENDENCIES += directfb
 else
 LIBECORE_CONF_OPT += --disable-ecore-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
 LIBECORE_CONF_OPT += --enable-ecore-fb
-LIBECORE_DEPENDENCIES += directfb
 else
 LIBECORE_CONF_OPT += --disable-ecore-fb
 endif
