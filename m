From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:39:59 +0200
Subject: [Buildroot] [PATCH 0/7] hashes: add more custom versions to the
	exclusion list (branch yem/no-hash-custom)
Message-ID: <cover.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds more custom versions to the list of files excluded from
the hash check.

As a side effect, it also fixes assigning to that exclusion list, adds a
hash to Xenomai, and switches gummiboot to use http:// instead of git://.

Regards,
Yann E. MORIN.


The following changes since commit 6b1f66643d782fc6f00e7436d41ceea6d88ad6bf:

  dhcpcd: fix ipv6 related compile failure (2015-04-28 21:44:55 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/no-hash-custom

for you to fetch changes up to c7721b4bf0d66994d78b3ad75a5371bdbe390d9a:

  package/xenomai: ignore custom versions (2015-04-29 00:32:16 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      boot/gummiboot: switch to http for git clone
      pkg-infra: assign BR_NO_CHECK_HASH_FOR so it is recursively-expanded
      boot/uboot: do not check hash for custom versions
      boot/barebox: do not check hash for custom versions
      boot/mxs-bootlets: do not check hash of custom tarball
      linux: do not check hashes for custom versions and tarballs
      package/xenomai: ignore custom versions

 boot/barebox/barebox.mk           | 4 ++++
 boot/gummiboot/gummiboot.mk       | 3 ++-
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 boot/uboot/uboot.mk               | 4 ++++
 linux/linux.mk                    | 5 +++++
 package/pkg-download.mk           | 4 +++-
 package/xenomai/xenomai.mk        | 3 +++
 7 files changed, 22 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
