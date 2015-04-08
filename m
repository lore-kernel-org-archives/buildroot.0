From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 19:08:31 +0200
Subject: [Buildroot] [PATCH 0/2] pkg-kconfig: fix checking .config file
	(branch yem/misc)
Message-ID: <cover.1428512591.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series tries to fix the pkg-kconfig infra for disabled packages.

Currently, the pkg-kconfig infra always checks that the specified
FOO_KCONFIG_FILE variable is set (and does not care if it's empty, as
long as it is set), even for packages that were not enabled by the user.

This is dubious at best, and forces kconfig-based packages to always set
that variable, even to an empty value.

Furthermore, it does not even check if the variable is non-empty.

Fix that in two ways:
  - only do the check when the package is actually enabled;
  - change the check to test if the variable is non-empty (instead of
    merely set).

Regards,
Yann E. MORIN.


The following changes since commit 2552729232b4d9c5cb63ad247d6d94ab83e48e49:

  package/mplayer: add optional libenca support (2015-04-07 23:27:23 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/misc

for you to fetch changes up to c5c81694cabca70c5651fe42a7de99247275659c:

  infra/pkg-kconfig: require an non-empty KCONFIG_FILE (2015-04-08 19:01:54 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      infra/pkg-kconfig: don't require a kconfig file for disabled packages
      infra/pkg-kconfig: require an non-empty KCONFIG_FILE

 package/pkg-kconfig.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
