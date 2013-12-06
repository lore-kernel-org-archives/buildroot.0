From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  6 Dec 2013 20:57:04 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem/host-packages
Message-ID: <cover.1386359706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series adds parted as a host package.
This will allow (eg.) post-image scripts to use parted.

Changes v1 -> v2:  (Thomas)
  - don't depend on host-lvm2
  - so don't add host-lvm2
  - relax dependencies on lvm2/readline for target package
  - fix typoes in commit log

Regards,
Yann E. MORIN.


The following changes since commit b21e0881c46d78b75f77f63a62864c8e45978d55:

  package: change tarball compression to xz (2013-12-06 15:50:49 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/host-packages

for you to fetch changes up to ecd2588ebee666a65987ebe0aec6ab6e83108e68:

  package/parted: add a host variant (2013-12-06 20:53:49 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/parted: relax dependency on lvm2
      package/parted: relax dependency on readline
      package/parted: add a host variant

 package/Config.in.host        |  1 +
 package/parted/Config.in      |  4 ----
 package/parted/Config.in.host |  6 ++++++
 package/parted/parted.mk      | 22 +++++++++++++++++++++-
 4 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 package/parted/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
