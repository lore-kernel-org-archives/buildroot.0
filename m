From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 11:05:31 +0200
Subject: [Buildroot] [PATCH 0/2 v4] busybox: improve support for telnetd
	(branch yem/pw)
Message-ID: <cover.1436778228.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series improves upon the previous iterations to auto-start telnetd
on the target.

It now removes handling of securetty altogether, since we've concluded
it is not used by util-linux' login utility, and can also be ignored by
busybox' login even with our current busybox defconfig.


Changes v3 -> v4:
  - drop support for securetty altogether


Regards,
Yann E. MORIN.


The following changes since commit b40509c7d80d6610b3f54e6da0dc1265bf6e9e22:

  package/x11r7/xdriver_xf86-video-r128: bump version to 6.10.0 (2015-07-13 10:16:13 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pw

for you to fetch changes up to 7d67670ffb919ed240b7fb157e44c8219375cff0:

  busybox: improve support for telnetd (2015-07-13 11:00:30 +0200)

----------------------------------------------------------------
Alexey Brodkin (1):
      busybox: improve support for telnetd

Yann E. MORIN (1):
      core/skeleton: drop /etc/securetty

 package/busybox/S50telnet     | 36 +++++++++++++++++++++++++++
 package/busybox/busybox.mk    |  9 +++++++
 package/util-linux/login.pam  |  1 -
 system/skeleton/etc/securetty | 57 -------------------------------------------
 system/system.mk              |  8 ------
 5 files changed, 45 insertions(+), 66 deletions(-)
 create mode 100755 package/busybox/S50telnet
 delete mode 100644 system/skeleton/etc/securetty

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
