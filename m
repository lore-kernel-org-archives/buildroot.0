From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:27:37 +1300
Subject: [Buildroot] [git commit] package/weston: do not try to build dev
	docs
Message-ID: <20170124052751.CF50981DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b05d2792ac0261a38b86bde418ed01a774582be7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The developper's documentation will be automatically built when doxygen
is present. But we can't guarantee that it is.

Besides, we are not interested in the devlopper's documentation.

Simply disable it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 3a02df0..9bd127c 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -20,6 +20,7 @@ WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-headless-compositor \
 	--disable-colord \
+	--disable-devdocs \
 	--disable-setuid-install
 
 WESTON_MAKE_OPTS = \
