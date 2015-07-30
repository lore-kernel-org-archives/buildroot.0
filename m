From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 Jul 2015 00:59:04 +0200
Subject: [Buildroot] [PATCH 0/3 v2] xorg: fix dependencies,
	add fbturbo driver (branch yem/xorg)
Message-ID: <cover.1438297123.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces three changes in our Xorg stack:
  - the dependency on libdrm is cleaned up
  - a missing dependency on libdrm has been added for DRI2
  - a new video driver, fbturbo, has been added (thanks Scott)


Changes v1 -> v2:
  - drop modular-server-as-default patch, committed
  - add fbturbo driver, which triggered the libdrm issue


Regards,
Yann E. MORIN.


The following changes since commit f986cca8b1967095871065371e75b2498b2185cd:

  freerdp: Add support for tz package (2015-07-30 23:37:26 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/xorg

for you to fetch changes up to 1717e338b9d4e5998366a2d5f11897749a546ca1:

  xdriver_xf86-video-fbturbo: new package (2015-07-31 00:22:13 +0200)

----------------------------------------------------------------
Scott Fan (1):
      xdriver_xf86-video-fbturbo: new package

Yann E. MORIN (2):
      package/xserver: commonalise dependency on libdrm
      package/xserver_xorg-server: dri2 needs libdrm

 package/x11r7/Config.in                             |  1 +
 package/x11r7/xdriver_xf86-video-fbturbo/Config.in  | 16 ++++++++++++++++
 .../xdriver_xf86-video-fbturbo.mk                   | 21 +++++++++++++++++++++
 package/x11r7/xserver_xorg-server/Config.in         |  1 +
 .../xserver_xorg-server/xserver_xorg-server.mk      | 19 ++++++++++++++-----
 5 files changed, 53 insertions(+), 5 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
