From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 21 Oct 2013 14:25:29 +0100
Subject: [Buildroot] [PATCH] webkit: fix target install
Message-ID: <1382361929-11261-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Commit 33a9d34ff375ec0c0389c9af6bc499a8dd7ccbc9 fixed the staging
install for webkit, which was hanging due to deadlock during parallel
make install.

This problem also afflicts the target install, which is fixed by this patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/webkit/webkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index eb1547b..21b535f 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -17,6 +17,7 @@ WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
 
 # parallel make install deadlocks with make 3.81
 WEBKIT_INSTALL_STAGING_OPT = -j1 DESTDIR=$(STAGING_DIR) install
+WEBKIT_INSTALL_TARGET_OPT = -j1 DESTDIR=$(TARGET_DIR) install
 
 # Does not build and it's disabled by default
 # in newer releases
-- 
1.8.3.2
