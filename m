From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 09:16:47 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: disable for Blackfin GNU
	Toolchain
Message-ID: <20140830072020.512029D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4905d7a3e1945d79084ca860ac88fbfedc01eaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those toolchains use gcc <= 4.3, which do not support required C++11 features.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 3fa638b..e99fddb 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
