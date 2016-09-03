From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Sep 2016 00:58:40 +0200
Subject: [Buildroot] [PATCH 0/4 v2] manual: remove lists of packages (branch
	yem/manual-no-package-list)
Message-ID: <cover.1472943074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series removes the list of packages from the manual

Those are huges, take up more than half of the manual and do not have
much value in the manual.

The only list tht kinda makes sense is the list iof virtual packages,
their symbols and their providers, to help in quickly identifying them
(for both users and packagers).

We replace the biggish and complex script that generates those lists
with a much simpler one that is targeted at only virtual packages.

The new script does not parse the Kconfig structure and uses a heuristic
to detect virtual packages and their providers: just grep the source
tree.

However, that turned up two discrepancies in how we define two virtual
packages, cryptodev and jpeg; their providers did not properly declare
themselves as providers.

We fix that, so the heuristic works for those two and their providers
as well.


Changes v1 -> v2:
  - keep the list of virtual packages
  - fix cryptodev and jpeg providers


Regards,
Yann E. MORIN.


The following changes since commit 15cf25114a4918bab0bf7a5d5cd198f864c02929

  agentpp: bump to 4.0.6 (2016-09-02 23:05:35 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to 206a0e9bf7a1e99fa176fe1345d245881f14b858

  manual: get rid of the lists of packages (2016-09-04 00:38:22 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/cryptodev: properly declare providers
      package/openssl: depend on the virtual cryptodev package
      package/jpeg: properly declare providers
      manual: get rid of the lists of packages

 docs/manual/appendix.txt                   |   32 +-
 docs/manual/manual.mk                      |   21 +-
 package/cryptodev-linux/cryptodev-linux.mk |    2 +
 package/jpeg-turbo/jpeg-turbo.mk           |    2 +
 package/libjpeg/libjpeg.mk                 |    1 +
 package/ocf-linux/ocf-linux.mk             |    2 +
 package/openssl/openssl.mk                 |    9 +-
 support/scripts/gen-manual-lists           |   62 +
 support/scripts/gen-manual-lists.py        |  513 ----
 support/scripts/kconfiglib.py              | 3541 ----------------------------
 support/scripts/readme.kconfiglib          |   30 -
 11 files changed, 76 insertions(+), 4139 deletions(-)
 create mode 100755 support/scripts/gen-manual-lists
 delete mode 100644 support/scripts/gen-manual-lists.py
 delete mode 100644 support/scripts/kconfiglib.py
 delete mode 100644 support/scripts/readme.kconfiglib

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
