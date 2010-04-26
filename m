From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Apr 2010 23:01:14 +0200
Subject: [Buildroot] [git commit master] alsa-utils: alsamixer needs WCHAR
Message-ID: <20100426210143.D0B4E20303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=671ec3917b7b8d9e6a22c1f881ff46808e3d8806
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-utils/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index 04057f4..3f30c61 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -27,8 +27,12 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	depends on BR2_USE_WCHAR
 	default y
 
+comment "alsamixer requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
 
-- 
1.6.3.3
