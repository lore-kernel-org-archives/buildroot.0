From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 16:14:51 +0100
Subject: [Buildroot] [PATCH 0/2 v3] toolchain: misc fixes (branch
	yem/toolchain-fixes)
Message-ID: <cover.1426604262.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces two fixes in the external toolchain handling:

  - reject "distro-class" toolchains, i.e. the  cross-oolchains packaged
    in Debian and its derivatives, since those toolchains are both
    non-relocatable and tainted with a lot of crap (i.e. non-libc
    libraries) which make them unfit for use by Buildroot;

  - try harder to find the gconv modules for those multi-arch
    toolchains, since there may be gconv modules for each variant, and
    thus would be located out-side the main sysroot.

Changes v2 -> v3:
  - update comment for distro-class toolchains  (Thomas, Arnout)
  - use TOOLCHAIN_EXTERNAL_PREFIX instead of asking gcc  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 9b8481671e9d0c6abc90d669f99c6925eda86c96:

  package/dovecot: bump version to 2.2.16 (2015-03-17 13:03:02 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/toolchain-fixes

for you to fetch changes up to 1d2730901d20f1f9bfcfde77883a385b49c73b00:

  toolchain: fix installing gconv libs with multi-arch toolchain (2015-03-17 15:04:23 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain/external: do not accept distro-class toolchains
      toolchain: fix installing gconv libs with multi-arch toolchain

 toolchain/helpers.mk   |  8 ++++++++
 toolchain/toolchain.mk | 26 ++++++++++++++++++--------
 2 files changed, 26 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
