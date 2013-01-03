From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jan 2013 22:18:56 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-firmware
Message-ID: <cover.1357247755.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here is a little series to rework the firmware packages in a consistent
way (or so I think).

This moves all packages providing firmware files (and only providing
firmware files) to their own sub-menu, so that:
  - they are easier to spot
  - it is more convenient to add new ones in the future

Also, new firmware files (for DVB tunners) can be installed from the
linux-firmware package.


The following changes since commit 31ff7b5eac3883a11faf60d9af0b47bfc2d903f3:

  docs: 2012.11.1 is out (2013-01-03 22:02:10 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-firmware

Yann E. MORIN (3):
      firmwares: add a new package category to locate all firmwares
      package/linux-firmware: reorganise config menus
      linux-firmware: add options for DVB firmware files

 package/Config.in                        |    8 +++--
 package/b43-firmware/Config.in           |    2 +-
 package/linux-firmware/Config.in         |   45 ++++++++++++++---------------
 package/linux-firmware/linux-firmware.mk |    9 ++++++
 4 files changed, 37 insertions(+), 27 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
