From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 17:17:48 +0200
Subject: [Buildroot] [PATCH 0/2] toolchain/external: fix installing libs to
	target (branch yem-ext-toolchain-fixes)
Message-ID: <cover.1464534979.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a proposal to fix a regresion in the way we copy the
libraries from an external toolchain to our target directory.

The issue at stake here is that, when a custom, local toolchain is used,
that has lib{32,64} symlinks to lib/ , we would copy too much into the
target directory.

I'm not entirely sure about the first patch; it might be dropped, as it
is not required to fix the reported problem.

The real fix is the second patch.

See the individual commits for explanations.

Regards,
Yann E. MORIN.


The following changes since commit 02302d21536b9c19cd87733f4eb1bd62065416bb

  core/pkg-kconfig: pass host PKG_CONFIG_PATH env var (2016-05-28 19:46:47 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to 16dd334fb29148489afa344c652208a4c512f445

  toolchain/helper: don't follow symlinks when copying libs to target (2016-05-29 17:15:41 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain/external: fix arch-subdir
      toolchain/helper: don't follow symlinks when copying libs to target

 toolchain/helpers.mk                               | 2 +-
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
