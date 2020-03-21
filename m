From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Mar 2020 10:35:01 +0100
Subject: [Buildroot] [PATCH 2/3] package/kodi-screensaver-rsxs: switch
 license to GPL-2.0+
In-Reply-To: <20200321093502.44867-1-bernd.kuhls@t-online.de>
References: <20200321093502.44867-1-bernd.kuhls@t-online.de>
Message-ID: <20200321093502.44867-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://github.com/xbmc/screensavers.rsxs/commit/dbb88536964dc0ca4144016eb12f7307b60cb1fa

removed lib/rsxs-1.0 which was licensed as GPL-3.0.

During the latest version bump
https://git.buildroot.net/buildroot/commit/package/kodi-screensaver-rsxs?id=e68bcc985fbb17e50cfa2944807090b6cd57c871

KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING

was removed but the corresponding license change was forgotton.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash | 1 +
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index b2d9e33a57..8f34b349e7 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 22ff3f0ca9679c59ce1a90b98d918dd10a8012b789729b2e44c04d4ce8c86ad8  kodi-screensaver-rsxs-7cb648507440d87948dec10d5bfdab3b722d37fe.tar.gz
+sha256 fa0ff8b6a6267b9477be7d505aa384056633b4be17e0b9d308df9bd70d1c99f6  debian/copyright
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index e208698797..aa881d0d59 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -6,7 +6,8 @@
 
 KODI_SCREENSAVER_RSXS_VERSION = 7cb648507440d87948dec10d5bfdab3b722d37fe
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
-KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
+KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
+KODI_SCREENSAVER_RSXS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm jpeg kodi libpng libtool tiff
 
 $(eval $(cmake-package))
-- 
2.25.0
