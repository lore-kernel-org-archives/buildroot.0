From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 16:58:49 +0200
Subject: [Buildroot] [PATCH 0/4 v8] linux-backports (new package) and misc
	related fixes (branch yem/linux-backports)
Message-ID: <cover.1437576751.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces linux-backports, which contains drivers from
recent kernels, backported unto older kernels (down to 3.0).

The series starts by fixing a shortcoming in the pkg-kconfig infra, then
does a bit of eye-candy in the Linux package, and finally introduces
linux-backports.

The thirs patch, linux-backports itself, uses a pure generic package,
and does not make use of the kernel-module infra, while the fourth and
latest patch converts it over to the kernel-module infra.

I'm not sure using the kernel-module infra is worth it, because it does
not gain us much in this case. Yet, it makes for a slightly more
beautiful .mk (IMHO!), even if a bit longer (+4 lines).

In the end, using it or not is the same to me (with a very slight
preference for using it, of course, but I won't mind either way).

Thanks go to Petr for doing the initial packaging of linux-backports,
and Arnout for suggesting the fix in patch 1. :-)

Regards,
Yann E. MORIN.


The following changes since commit 1f640a4e7a42667a88101f6ceb787fbb118a6acf:

  zedboard: Switch to U-Boot 2015.07 (2015-07-22 14:31:55 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/linux-backports

for you to fetch changes up to 200f17ef13ac12610b33139a1b1f8820fc0c85bd:

  package/linux-backports: switch to using the kernel-module infra (2015-07-22 16:44:57 +0200)

----------------------------------------------------------------
Petr Vorel (1):
      package/linux-backports: new package

Yann E. MORIN (3):
      core/pkg-kconfig: do not override @D
      package/linux: trash stderr in LINUX_VERSION_PROBED
      package/linux-backports: switch to using the kernel-module infra

 linux/linux.mk                               |  2 +-
 package/Config.in                            |  1 +
 package/linux-backports/Config.in            | 52 ++++++++++++++++++
 package/linux-backports/linux-backports.hash |  2 +
 package/linux-backports/linux-backports.mk   | 81 ++++++++++++++++++++++++++++
 package/pkg-kconfig.mk                       | 16 +++---
 6 files changed, 146 insertions(+), 8 deletions(-)
 create mode 100644 package/linux-backports/Config.in
 create mode 100644 package/linux-backports/linux-backports.hash
 create mode 100644 package/linux-backports/linux-backports.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
