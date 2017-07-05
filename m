From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:49:08 +0200
Subject: [Buildroot] [git commit] pkg-autotools: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
Message-ID: <20170705095036.33A7C7FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8529a7d9a7e9780a4557e4d0956161e4a9519c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Build-tested with a bunch of autotools packages.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ba1f4d9..45de993 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -220,7 +220,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
 	./configure \
-		--prefix="$$(HOST_DIR)/usr" \
+		--prefix="$$(HOST_DIR)" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		--localstatedir="$$(HOST_DIR)/var" \
 		--enable-shared --disable-static \
