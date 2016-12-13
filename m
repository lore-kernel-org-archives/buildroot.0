From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Dec 2016 22:37:44 +0100
Subject: [Buildroot] [PATCH 0/3] core/pkg-infra: allow packages to provide
	permisions in a file
Message-ID: <cover.1481665059.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a quick proof-of-concpet to allow packages to provide a
permission table in a file rather than in-line in the .mk fiile.

That permission file can be generated. It is usefull for the SELinux
stuff and busybox, where individual applets should have a suid bit, but
we only know what applets exist at configure time, not when parsing the
.mk file.

This is RFC material, jsut for quick review of the concept, not the
actual code. This is not meant to be applied now.


Regards,
Yann E. MORIN.


The following changes since commit aa9a838364c7d60fd32eb265a88dea17a2be8324

  zlib: use $(HOST_MAKE_ENV) when calling $(MAKE1) (2016-12-13 16:27:34 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6d7c0fcf8647fa6e554e32e0370baec848b9ddef

  [RFC] package/busybox: gneerate permissions for enabeld applets (2016-12-13 22:34:36 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      core: allow packages to declare a permission file
      docs/manual: document FOO_PERMISSIONS_FILE
      [RFC] package/busybox: gneerate permissions for enabeld applets

 docs/manual/adding-packages-generic.txt |  8 +++++++-
 fs/common.mk                            |  1 +
 package/busybox/busybox.mk              | 15 +++++++++++++++
 package/pkg-generic.mk                  |  1 +
 4 files changed, 24 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
