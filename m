From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:35:09 +0200
Subject: [Buildroot] [PATCH 0/7 v2] weston: new freerdp backend (branch
	yem/bumps)
Message-ID: <cover.1412634775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds the RDP backend to Weston. As a side effect, it cleans
up and enhances FreeRDP.


Changes v1 -> v2:
  - new package python-lxml, needed for opengl-registry (Tomas P.)
  - cleanup opengl-registry and nvidia-driver  (Thomas P.)
  - drop applied patches  (Thomas P.)


Regards,
Yann E. MORIN.


The following changes since commit 7349af1bc4ed941d59c0c9971007479881379d3f:

  openvmtools: remove unnecessary C flag (2014-10-06 21:16:09 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/bumps

for you to fetch changes up to 66cae859536aae20b149c905d270b48176057b9d:

  package/weston: add support for the RDP compositor (2014-10-07 00:14:13 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      pacakge/freerdp: disable building the manpages
      package/freerdp: do not forcibly depend on X.Org
      package/freerdp: add missing dependency
      package/freerdp: add options to enable/disable server and/or client
      package/freerdp: also install to staging
      package/freerdp: install server key and certificate
      package/weston: add support for the RDP compositor

 package/Config.in          |  2 +-
 package/freerdp/Config.in  | 34 +++++++++++++++++++++++++++++-----
 package/freerdp/freerdp.mk | 39 +++++++++++++++++++++++++++++++++++++--
 package/weston/Config.in   | 17 +++++++++++++++++
 package/weston/weston.mk   |  7 +++++++
 5 files changed, 91 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
