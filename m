From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2015 23:55:25 +0200
Subject: [Buildroot] [PATCH 0/2 v9] linux-backports: new package (branch
	yem/linux-backports)
Message-ID: <cover.1437688336.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces linux-backports, which contains drivers from
recent kernels, backported unto older kernels (down to 3.0).

The first patch, linux-backports itself, uses a pure generic package,
and does not make use of the kernel-module infra, while the second and
last patch converts it over to the kernel-module infra.

I'm not sure using the kernel-module infra is worth it, because it does
not gain us much in this case. Yet, it makes for a slightly more
beautiful .mk (IMHO!).

In the end, using kernel-module or not is the same to me (with a very
slight preference for using it, of course, but I won't mind either way).

Thanks to Petr for doing the initial packaging of linux-backports. :-)


Changes v8 -> v9:
  - better depend on linux' .config  (Thomas)
  - comment the kernel-module conversion  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 89d21ce29b5be996d130f7944095918b3e8dd613:

  fan-ctrl: mark as broken until SourceForge is back up (2015-07-23 23:38:28 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/linux-backports

for you to fetch changes up to be87567542fc8e3133115311bc25fd91df40ed38:

  package/linux-backports: switch to using the kernel-module infra (2015-07-23 23:45:43 +0200)

----------------------------------------------------------------
Petr Vorel (1):
      package/linux-backports: new package

Yann E. MORIN (1):
      package/linux-backports: switch to using the kernel-module infra

 package/Config.in                            |  1 +
 package/linux-backports/Config.in            | 52 +++++++++++++++
 package/linux-backports/linux-backports.hash |  2 +
 package/linux-backports/linux-backports.mk   | 99 ++++++++++++++++++++++++++++
 4 files changed, 154 insertions(+)
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
