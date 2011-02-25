From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 21:08:35 +0100
Subject: [Buildroot] [git commit master 1/1] alsamixergui: fix alsa
	dependencies
Message-ID: <20110225201050.42EF58F782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=464270128112bce9169bea5d48d90bf695842ec7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alsamixergui needs pcm and mixer support in alsa-lib.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/alsamixergui/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 5b53e6a..3afc314 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_ALSA_LIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_FLTK
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
-- 
1.7.3.4
