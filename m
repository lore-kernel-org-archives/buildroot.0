From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:39:26 +0100
Subject: [Buildroot] [PATCH 0/6 v3] weston: new freerdp backend (branch
	yem/freerdp)
Message-ID: <cover.1417952276.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds the RDP backend to Weston. As a side effect, it cleans
up and enhances FreeRDP.


Changes v2 -> v3:
  - rework completely the depednencies on X11 libraries  (Samuel)
  - only install keys when the server is enabled  (Samuel)

Changes v1 -> v2:
  - new package python-lxml, needed for opengl-registry (Tomas P.)
  - cleanup opengl-registry and nvidia-driver  (Thomas P.)
  - drop applied patches  (Thomas P.)


Regards,
Yann E. MORIN.


The following changes since commit c5f0e93d2cc6107cce249e1f11158aeccb4a3449:

  rp-pppoe: install default conf file (2014-12-03 23:26:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot 

for you to fetch changes up to 60f5963bb803d787a63918b0425798e7463984ff:

  package/weston: add support for the RDP compositor (2014-12-07 12:37:40 +0100)

----------------------------------------------------------------
Yann E. MORIN (6):
      pacakge/freerdp: disable building the manpages
      package/freerdp: do not forcibly depend on X.Org
      package/freerdp: add options to enable/disable server and/or client
      package/freerdp: also install to staging
      package/freerdp: install server key and certificate
      package/weston: add support for the RDP compositor

 package/Config.in                                  |  2 +-
 package/freerdp/Config.in                          | 29 ++++++--
 .../freerdp-0002-fix-building-shared-libs.patch    | 23 ++++++
 package/freerdp/freerdp.mk                         | 84 +++++++++++++++++++++-
 package/weston/Config.in                           | 17 +++++
 package/weston/weston.mk                           |  7 ++
 6 files changed, 154 insertions(+), 8 deletions(-)
 create mode 100644 package/freerdp/freerdp-0002-fix-building-shared-libs.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
