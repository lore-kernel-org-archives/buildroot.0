From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 21:55:20 +0100
Subject: [Buildroot] [PATCH 0/5 v4] package/xenomai: add alternate download
 locations (branch yem/xenomai-custom)
Message-ID: <cover.1579035147.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, initiated by Jan to get arbitrary git revision from the
official Xenomai git tree, was morphed and expanded by Yann to include
all the usual alternate download locations (like for the other packages
like linux, uboot...). Some refactoring to the version handling ensued.

Using a git tree is needed, as some versions are tagged, but not
tarballed. So, as a git download is needed, let's just expand that to
the other usual VCS as well.

The most complex is the first patch, with the shuffling around of the
version handling, but the rest is pretty straightforward.


Regards,
Yann E. MORIN.


The following changes since commit e2e57d56787b7a7d24ed3f9a97902d2bbd58c190

  docs/manual: run-tests test framework (2020-01-14 17:29:23 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 65857f8b385110e6dfc59ae8011df19181006c1b

  package/xenomai: add support to download from a custom svn tree (2020-01-14 21:31:36 +0100)


----------------------------------------------------------------
Jan Kiszka (1):
      package/xenomai: add support to download from a custom git tree

Yann E. MORIN (4):
      package/xenomai: move the version setting to Kconfig
      package/xenomai: add support to download a custom tarball
      package/xenomai: add support to download from a custom Hg tree
      package/xenomai: add support to download from a custom svn tree

 package/xenomai/Config.in  | 50 +++++++++++++++++++++++++++++++++++++---------
 package/xenomai/xenomai.mk | 27 +++++++++++++++++++------
 2 files changed, 62 insertions(+), 15 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
