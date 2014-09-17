From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 10:08:15 -0300
Subject: [Buildroot] [PATCHv3 0/6] Ncurses wide support
Message-ID: <1410959301-28053-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the compiled series for ncurses wide support.
Tested a while ago with an allyespackageconfig.
Closes bug #6950

Changes for v2:
  Make the static fix patch also do it for dynamic targets as well

Changes for v3:
  Add alsa-utils & dialog fixes

Gustavo Zacarias (5):
  package/ncurses: fixup library symlink for static libs
  nano: enable ncursesw support
  httping: enable ncurses support
  alsa-utils: fixup ncurses config script
  dialog: fixup ncurses config script

Jeremy Kerr (1):
  package/ncurses: Allow building wide char support

 package/alsa-utils/alsa-utils.mk |  4 ++--
 package/dialog/dialog.mk         |  2 +-
 package/httping/httping.mk       |  3 ++-
 package/nano/nano.mk             |  9 +++++++--
 package/ncurses/Config.in        |  8 ++++++++
 package/ncurses/ncurses.mk       | 35 +++++++++++++++++++++++++++++++++--
 6 files changed, 53 insertions(+), 8 deletions(-)

-- 
1.8.5.5
