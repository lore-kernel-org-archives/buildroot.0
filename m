From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2016 22:23:35 +0100
Subject: [Buildroot] [pull request] makedevs: accept usernames and group
	names
Message-ID: <cover.1453411322.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt to ad the possibility to use actual usernames
and group names in the _PERMISSIONS and _DEVICES tables, and not be
limitted to only numerical UIDs and GIDs.

The 4th and last patch in the series should *not* be applied, it is only
provided as a simple test-bed to check this series.

Regards,
Yann E. MORIN.


The following changes since commit f557fcac7eeff0d2167852b44a8f596f12e4c9b4:

  libsecret: bump to version 0.18.4 (2016-01-21 15:26:53 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/etc-passwd

for you to fetch changes up to 1091c86340c443e61aba2523f0eb9ef7a2881e6a:

  [DO NOT COMMIT] busybox: user username and group name (2016-01-21 22:21:25 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      fs/common: generate users before setting permissions
      package/makedevs: use the rooted /etc/passwd and /etc/group
      docs/manual: makedev syntax accepts usernames and group names
      [DO NOT COMMIT] busybox: user username and group name

 docs/manual/adding-packages-generic.txt | 22 ++++++++++----------
 docs/manual/makedev-syntax.txt          | 20 ++++++++++--------
 fs/common.mk                            | 10 ++++-----
 package/busybox/busybox.mk              |  6 +++++-
 package/makedevs/makedevs.c             | 36 ++++++++++++++++++++++++++-------
 5 files changed, 62 insertions(+), 32 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
