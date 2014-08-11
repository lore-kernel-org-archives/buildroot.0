From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 11 Aug 2014 13:42:50 +0200
Subject: [Buildroot] [PATCH 0/4] mpd: Fix config options
Message-ID: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The config options in mpd.mk for plugin FAAD2 and FLAC are wrong and fixed
with the first to patches.

In mpd.mk some plugin options are explicitly enabled and some are explicitly 
disabled. When building mpd the most plugin options are autoselected if an 
appropriate library exist in the build system. This may lead to an undesired 
behaviour if a plugin option is not selected in the Config menu by the user, 
but mpd will be build with this plugin. The third patch fixes this issue.

In Config.in is an option for BR2_PACKAGE_MPD_MAD, but in mpd.mk this config
option is missing. The fourth patch fixes this issue.

J?rg Krause (4):
  mpd: Fix config option for plugin FAAD2
  mpd: Fix config option for plugin FLAC
  mpd: Set enable/disable config option for all plugins
  mpd: Add missing config option for plugin MAD

 package/mpd/mpd.mk | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

-- 
2.0.4
