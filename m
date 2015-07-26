From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2015 00:35:09 +0200
Subject: [Buildroot] [PATCH 0/3] xorg: misc fixes and changes (branch
	yem/xorg)
Message-ID: <cover.1437950027.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces three changes in our Xorg stack:
  - the default server is changed from KDrive to modular
  - the dependency on libdrm is cleaned up
  - a missing dependency on libdrm has been added for DRI2


Regards,
Yann E. MORIN.


The following changes since commit 5ccde01652bc41da325bf4c9a5abbf0031080784:

  php: remove redundant --static flag to pkg-config (2015-07-26 23:45:02 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/xorg

for you to fetch changes up to ed8d79ec52aec5a5724e4a93b65d6f54240a750c:

  package/xserver_xorg-server: dri2 needs libdrm (2015-07-27 00:31:49 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/xserver: switch to the modular server as default
      package/xserver: commonalise dependency on libdrm
      package/xserver_xorg-server: dri2 needs libdrm

 package/x11r7/xserver_xorg-server/Config.in           |  2 +-
 .../x11r7/xserver_xorg-server/xserver_xorg-server.mk  | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
