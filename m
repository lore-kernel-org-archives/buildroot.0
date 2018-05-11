From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 May 2018 18:29:54 +0200
Subject: [Buildroot] [PATCH 0/2] packages;
 fix last remnants of hard-coded BR2_DL_DIR
Message-ID: <cover.1526056187.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Two packages, asterisk and dahdi-linux, were overlooked when we did the
transition to a per-package download directory, which means they are now
failing because they can't find their extra files.

This series fixes that.


Regards,
Yann E. MORIN.


The following changes since commit 72703d02b96bb1f7f94f705d3a7199599b1bc980

  support/dependencies: check that PATH does not contain CWD (2018-05-09 23:26:18 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 7cf1082497a62fa2ea47b0357101efa33b453aac

  package/dahdi-linux: use package's DL_DIR (2018-05-11 18:10:20 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/asterisk: use package's DL_DIR
      package/dahdi-linux: use package's DL_DIR

 package/asterisk/asterisk.mk       | 2 +-
 package/dahdi-linux/dahdi-linux.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
