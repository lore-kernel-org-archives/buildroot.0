From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 17:28:28 +0100
Subject: [Buildroot] [git commit] alsamixergui: needs mmu
Message-ID: <20131028162845.8AC9E9BC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca5639f8d00aae6427054dee1f0433583ad3041d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because of the new fl_open_uri() function since the fltk bump using
fork().

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsamixergui/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index acc3cc9..b1b9eb9 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fltk fork()
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
