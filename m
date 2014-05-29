From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:19 +0200
Subject: [Buildroot] [PATCH 0/11 RFC] Add list of virtual packages to manual
	(branch yem/manual)
Message-ID: <cover.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series intend to add the list of virtual pacakges to the manual, for
three reasons:

  - for users that are told (in a comment in the menuconfig) that a
    pacakage they need depends on a virtual pacakge, to know what provider
    to select,

  - for people writing a new provider for an existing virtual package to
    have a reference of which symbol to select and which package to provide
    in their Config.in and .mk files,

  - for people writing a new package that depends on features provided by
    a virtual pacakge to know what symbol to depend on.

The series starts with some preparatory changes and cleanups, then
introduces a away to generate different forms of tables, then goes on by
removing virtual packages from the current lists, and finally add a new
list with the virtual packages.

I consider this to be in RFC stage for now, especially as I would like
some feedback on the changes I made on the Python script, changes which
were done in an ad-hoc fashion, until it works, but will probably need
some more love to be clean.

Special thanks to Samuel for his pythonistic help! :-)

Regards,
Yann E. MORIN.


The following changes since commit d830cceba5350f75c5a753c81811ed19cd3d17c2:

  Update for 2014.05-rc3 (2014-05-28 17:07:11 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/manual

for you to fetch changes up to 9c5df6459abdeee10721e353296cf776a5021f31:

  docs/manual: add the virtual packages list (2014-05-29 22:11:17 +0200)

----------------------------------------------------------------
Yann E. MORIN (11):
      support/scripts: prepare expanding the packages lists
      support/scripts: document args to _is_package() in gen-manual-lists
      support/scripts: prepare handling virtual packages in generated lists
      support/scripts: do not display virtual packages in generated lists
      support/scripts: who's responsibile to decide what is a package
      support/scripts: introduce a symbol formatter to generate package lists
      package/cryptodev: make it behave more like other virtual packages
      package/jpeg: make it behave more like other virtual packages
      package/mesa3d: rename the prompt
      support/scripts: generate a list of virtual packages
      docs/manual: add the virtual packages list

 docs/manual/adding-packages-directory.txt |  10 ++
 docs/manual/adding-packages-virtual.txt   |   6 +
 docs/manual/appendix.txt                  |   8 ++
 package/cryptodev/Config.in               |   4 +-
 package/jpeg/Config.in                    |   4 +-
 package/mesa3d/Config.in                  |   2 +-
 support/scripts/gen-manual-lists.py       | 207 ++++++++++++++++++++++++------
 7 files changed, 199 insertions(+), 42 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
