From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Nov 2015 15:39:37 +0100
Subject: [Buildroot] [PATCH 0/3] core+gcc: align configure commands (branch
	yem/quickies-for-master)
Message-ID: <cover.1448202976.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a cleanup of the configure commands, both in the common
autotools infra and in the gcc-final package:

  - the host variant of the generic configure command is not indented
    the same way as the target variant; this is fixed.

  - the gcc-final package has to override the default configure command,
    but the reasons for it were not explained in the code, and the
    corresponding commit is terse on the explanations; a comment is
    added.

  - the gcc-final custom configure command has diverged quite a bit from
    the generic one; update it.

Regards,
Yann E. MORIN.


The following changes since commit c9d9bcb4e13651faf1898e9dcfa6d7af707a092b:

  package/zmqpp: add patch to fix build issue (2015-11-22 14:26:18 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/quickies-for-master

for you to fetch changes up to 4d9f7a6896c496372a4f415987e60eeeac79225b:

  package/gcc: align gcc-final configure-cmds to the generic ones (2015-11-22 15:34:53 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      core/pkg-autotools: align host configure commands to target one
      package/gcc: comment on why we override the generic configure commands
      package/gcc: align gcc-final configure-cmds to the generic ones

 package/gcc/gcc-final/gcc-final.mk | 34 +++++++++++++++++++++++++++++-----
 package/pkg-autotools.mk           | 12 ++++++------
 2 files changed, 35 insertions(+), 11 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
