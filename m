From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Aug 2014 19:20:08 +0200
Subject: [Buildroot] [PATCH 0/2] Fix pkg-kconfig infra (branch yem/kconfig)
Message-ID: <cover.1407172590.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes a nasty regression introduced with the pkg-kconfig
infrastructure recently applied, whereby kconfig packages are always
rebuilt on each 'make'.

The proposed fix consists in a post-configure hook, and I believe this
is enough to get us rolling for the next release.

A better fix would be to move the call to 'oldocnifg' out of the
packages, and into the kconfig infra itself, but this is a bit more
involved. This could be done in -next (or maybe in master shortly after
-rc1 if possible).

Regards,
Yann E. MORIN.


The following changes since commit 98a18ea01d7ea3f69bf5c44d48358dd110764c9c:

  m2tools: fix MIA comment dependencies (2014-08-04 18:29:40 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/kconfig

for you to fetch changes up to fb48537ba04cc50d1f8043e5e347dedcdd5ba671:

  infra/pkg-kconfig: do not rebuild kconfig packages again and again (2014-08-04 19:13:30 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      infra/pkg-kconfig: join comments to the related code-block
      infra/pkg-kconfig: do not rebuild kconfig packages again and again

 package/pkg-kconfig.mk | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
