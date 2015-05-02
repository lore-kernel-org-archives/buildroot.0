From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 11:05:01 +0200
Subject: [Buildroot] [PATCH 0/7 v2] hashes: add more custom versions to the
	exclusion list (branch yem/no-hash-custom)
Message-ID: <cover.1430557268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds more custom versions to the list of files excluded from
the hash check.

It first fixes the way we declare the BR_NO_CHECK_HASH_FOR variable,
goes on to exclude custom versions for the bootloaders and the kernel,
and ads a hash for Xenomai.

Thanks to Arnout for his thorough review of the first iteration! :-)


Changes v1 -> v2:
  - smaller'n'better test-case for BR_NO_CHECK_HASH_FOR  (Arnout)
  - fix'n'tweak some commit logs  (Arnout)
  - handle same-as-headers kernel version  (Arnout)


Regards,
Yann E. MORIN.


The following changes since commit 40df43ac667bf6fff9ec7072ade19cb3a311a1da:

  network-manager: needs (e)glibc (2015-05-02 10:23:05 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/no-hash-custom

for you to fetch changes up to 60d37b8077174e14c662179b863d4f5045a8ffd1:

  linux: do not check hashes for custom versions and tarballs (2015-05-02 10:57:26 +0200)

----------------------------------------------------------------
Yann E. MORIN (7):
      pkg-infra: assign BR_NO_CHECK_HASH_FOR so it is recursively-expanded
      boot/uboot: do not check hash for custom versions
      boot/barebox: do not check hash for custom versions
      boot/mxs-bootlets: do not check hash of custom tarball
      package/xenomai: ignore custom versions
      package/xenomai: add hash file
      linux: do not check hashes for custom versions and tarballs

 boot/barebox/barebox.mk           | 4 ++++
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 boot/uboot/uboot.mk               | 4 ++++
 linux/linux.mk                    | 7 +++++++
 package/pkg-download.mk           | 4 +++-
 package/xenomai/xenomai.hash      | 2 ++
 package/xenomai/xenomai.mk        | 2 ++
 7 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 package/xenomai/xenomai.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
