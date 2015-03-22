From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 18:18:18 +0100
Subject: [Buildroot] [PATCH 0/3] introduce maintainers (branch
	yem/maintainers)
Message-ID: <cover.1427044305.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series introduces the notion of maintainers.

We introduce a top-level MAINTAINERS file, not unlike the Linux kernel,
but sorted by people rather than topics; more than one person may
register as maintainer for a specific topic. Topics are patterns that
refer to any file or directory in the tree; see the first patch and the
content of MAINTAINERS for how it is formatted.

We also introduce a script to help find a maintainer for a pacakge or an
architecutre, which can get its input via:
  - command-line arguments '-p PKG' or '-a ARCH',
  - an autobuild result "-b SHA1" or "-b URL",
  - a patch on stdin.

And I added myself as a maintainer for some stuff.

Regards,
Yann E. MORIN.


The following changes since commit e16796942a6f68391e69961e5045ce20b56063e2:

  attr: backport upstream patches to fix build on musl (2015-03-21 10:13:51 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/maintainers

for you to fetch changes up to cb8b3fc6e8a055d56c8fbedccace7adc5b700f2a:

  maintainers: add myself to a bit more stuff (2015-03-22 18:06:11 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      support: add script to find maintainers
      support/maintainers: add support for autobuild results
      maintainers: add myself to a bit more stuff

 MAINTAINERS                      |  49 ++++++++++
 support/scripts/check-maintainer | 191 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 MAINTAINERS
 create mode 100755 support/scripts/check-maintainer

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
