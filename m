From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Dec 2016 20:02:11 +0100
Subject: [Buildroot] [PATCH 0/3] core/pkg-infra: allow packages to provide
	permisions in a file
Message-ID: <cover.1482346921.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series allows packages to provide a permission table in a file
rather than in-line in the .mk fiile.

That permission file can be generated. It is usefull for the SELinux
stuff and busybox, where individual applets should have a suid bit, but
we only know what applets exist at configure time, not when parsing the
.mk file.

The last patch is *not* to be applied; it serves just as an example of
how the new permisions file can be generated.


Regards,
Yann E. MORIN.


The following changes since commit 0c5beb6501707dd5cb80484562bf2b0cbe2b4423

  libcurl: security bump to 7.52.0 (2016-12-21 19:44:44 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6fa811da3de50b45790aaeafbf81f2225761abf4

  [RFC] package/busybox: gneerate permissions for enabeld applets (2016-12-21 20:01:39 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      core: allow packages to declare a permission file
      docs/manual: document FOO_PERMISSIONS_FILE
      [RFC] package/busybox: gneerate permissions for enabeld applets

 docs/manual/adding-packages-generic.txt |  8 +++++++-
 fs/common.mk                            |  3 +++
 package/busybox/Config.in               |  3 +++
 package/busybox/busybox.mk              | 15 +++++++++++++++
 package/pkg-generic.mk                  |  1 +
 5 files changed, 29 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
