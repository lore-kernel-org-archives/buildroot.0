From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Mar 2017 22:52:47 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: add missing help keyword
Message-ID: <20170309215445.F04DD82558@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5354a75eb12009162dad0bc3fe5dc9d20fe8183b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ac1910713ce (efl: remove broken JP2K loader) added a legacy entry for
BR2_PACKAGE_EFL_JP2K, but forgot to add the 'help' keyword before the help
text, leading to confusing error messages from kconfig:

Config.in.legacy:482: syntax error
Config.in.legacy:481: unknown option "JP2K"
Config.in.legacy:482: unknown option "while"
Config.in.legacy:483: unknown option "JP2K"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 67f6e4e..be4c953 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -478,6 +478,7 @@ comment "Legacy options removed in 2016.08"
 config BR2_PACKAGE_EFL_JP2K
 	bool "libevas jp2k loader has been removed"
 	select BR2_LEGACY
+	help
 	  JP2K support in EFL requires openjpeg 1.x (libopenjpeg1.pc)
 	  while Buildroot only packages openjpeg 2.x. Therefore, the
 	  JP2K loader has been removed from EFL.
