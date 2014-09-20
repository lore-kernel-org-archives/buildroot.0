From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:52 +0200
Subject: [Buildroot] [PATCH 0/10] wayland: bump and new backend (branch
	yem/bumps)
Message-ID: <cover.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bumps wayland and weston, and adds the rdp backend to
weston. As a side effect, it bumps libinput, and bumps, cleans up
and enhances freerdp.

Regards,
Yann E. MORIN.


The following changes since commit b7fcf3bc5643a75898c76d5610360b6560a695f2:

  sudo: bump to version 1.8.10p3 (2014-09-19 23:21:48 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/bumps

for you to fetch changes up to a469e9d1e552f6b3f08eaf5ab4f426365b96ca8c:

  package/weston: add support for the RDP compositor (2014-09-20 19:04:51 +0200)

----------------------------------------------------------------
Yann E. MORIN (10):
      package/libinput: bump version
      package/freerdp: bump version
      package/freerdp: do not forcibly depend on X.Org
      pacakge/freerdp: disable building the manpages
      package/freerdp: add options to enable/disable server and/or client
      package/freerdp: also install to staging
      package/freerdp: install server key and certificate
      package/wayland: bump to 1.6.0
      package/weston: bump to 1.6.0
      package/weston: add support for the RDP compositor

 package/Config.in                                  |  2 +-
 package/freerdp/Config.in                          | 31 +++++++--
 package/freerdp/freerdp-0001-ffmpeg.patch          | 78 ----------------------
 package/freerdp/freerdp.mk                         | 39 ++++++++++-
 ...put-01-rename-log_msg-to-libinput_log_msg.patch | 54 ++++++++-------
 package/libinput/libinput.mk                       |  2 +-
 package/wayland/wayland.mk                         |  2 +-
 package/weston/Config.in                           | 17 +++++
 package/weston/weston-0000-safe-foreach.patch      | 36 ----------
 package/weston/weston.mk                           |  9 ++-
 10 files changed, 121 insertions(+), 149 deletions(-)
 delete mode 100644 package/freerdp/freerdp-0001-ffmpeg.patch
 delete mode 100644 package/weston/weston-0000-safe-foreach.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
