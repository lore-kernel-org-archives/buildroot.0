From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Nov 2014 16:59:54 +0100
Subject: [Buildroot] [PATCH 0/2] parted: fix static link (branch
	yem/for-release)
Message-ID: <cover.1417276704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This seriesis an RFC to fix building parted in static links.

I have no good idea on how to properly fix the libuuid .pc file, so I
did it iwth a conditional post-install hook. I'm sure this is not the
best option, but I can't think of anything better (yet).

Of course, the parted patch is dependent on the preceding util-linux
patch, but can still be applied without it, because at worst it would
leave us in the same situation as we ar today.

Still, this is just an RFC to see what you guys think about it.

Regards,
Yann E. MORIN.


The following changes since commit fcd082a0c3f78381ecdf41d487405434fabd09b0:

  package/libwebsockets: fiux static build (2014-11-29 15:47:28 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/for-release

for you to fetch changes up to 4431396aaa3e810c5ef599e341858e8849d530e1:

  package/parted: fix static link (2014-11-29 16:57:56 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/util-linux: libuuid needs -lintl
      package/parted: fix static link

 .../parted/parted-003-fix-static-link-uuid.patch    | 21 +++++++++++++++++++++
 package/util-linux/util-linux.mk                    |  8 ++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/parted/parted-003-fix-static-link-uuid.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
