From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Dec 2018 16:18:48 +0100
Subject: [Buildroot] [PATCH 0/2 v3] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
Message-ID: <cover.1545491919.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series is my counter-proposal to Joel's path to try and
fix the issue:
    https://patchwork.ozlabs.org/patch/1009168/

The first patch fixes the absolute symlinks, that were so far not
accounted for at all. A new helper scripts changes them into relative
symlinks.

The second patch is the actual fix to the issue Joel's patch was trying
to solve. I believe it is a better and simpler solution, although I have
to admit the patsubst trickery is not obvious.


Regards,
Yann E. MORIN.


The following changes since commit ee58353462f32f46f3f5b93f6dc78e94b31bad78

  DEVELOPERS: remove Vicente Olivert Riera (2018-12-22 08:10:03 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 235301274e7a921bb0b98aa606403b12fbee08be

  core/sdk: don't mangle symlinks with '.' or '..' at start (2018-12-22 13:55:04 +0100)


----------------------------------------------------------------
Joel Carlson (1):
      core/sdk: don't mangle symlinks with '.' or '..' at start

Yann E. MORIN (1):
      core: make symlinks relative when preparing the SDK

 Makefile                     |  5 ++--
 support/scripts/fix-symlinks | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100755 support/scripts/fix-symlinks

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
