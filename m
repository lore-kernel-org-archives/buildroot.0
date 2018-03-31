From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 09:20:17 +0200
Subject: [Buildroot] [PATCH 0/2] Fix fallout after hack to disable C++
Message-ID: <cover.1522480811.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series fixes the fallout in the two identified packages that
suffered from the switch CXX from 'false' to 'no'.

Those packages (really, just jimtcl, but standalone and bundled in
openocd), really wnat that the executable exists. So we point it back to
'false'.


Regards,
Yann E. MORIN.


The following changes since commit 9b2f6548f8d2cad52fd3a5f81febf4818ee66304

  zstd: fix legal info (2018-03-30 22:02:03 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8162669309357bfbd684960e225b215ccd2abec1

  package/openocd: fix fallout after no-C++ fixups (2018-03-31 09:17:25 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/jimtcl: fix fallout after no-C++ fixups
      package/openocd: fix fallout after no-C++ fixups

 package/jimtcl/jimtcl.mk   | 6 +++++-
 package/openocd/openocd.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
