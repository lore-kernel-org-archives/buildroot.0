From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 23:06:16 +0200
Subject: [Buildroot] [git commit branch/next] weston: enable nested wayland
	compositor
Message-ID: <20160527210630.E91DD81F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716ac19502392e0306ddcd9a5dc28edd6caf4205
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It may be useful in some scenarios and size growth is marginal at best.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 38a0d37..8455a94 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -18,7 +18,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-wayland-compositor \
 	--disable-headless-compositor \
 	--disable-colord \
 	--disable-setuid-install
