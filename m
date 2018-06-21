From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jun 2018 22:33:49 +0200
Subject: [Buildroot] [git commit] pulseaudio: remove autoreconf
Message-ID: <20180621203240.E3E88814AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b077257de88ed25cba6ad542196bbf5b604b93d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 08c7b77803285 (package/pulseaudio: bump version to 12.0) removed
configure.ac patch, but forgot to drop autoreconf. Fix that.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 1f6bab2e3d..55f9def639 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -15,9 +15,6 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
-# 0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
-PULSEAUDIO_AUTORECONF = YES
-
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
