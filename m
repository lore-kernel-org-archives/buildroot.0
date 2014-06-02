From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jun 2014 23:06:09 +0200
Subject: [Buildroot] [PATCH 0/11 v2] Add list of virtual packages to manual
	(branch yem/manual)
Message-ID: <cover.1401743146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series intends to add the list of virtual packages to the manual, for
three reasons:

  - for users that are told (in a comment in the menuconfig) that a
    package they need depends on a virtual package, to know what provider
    to select,

  - for people writing a new provider for an existing virtual package to
    have a reference of which symbol to select and which package to provide
    in their Config.in and .mk files,

  - for people writing a new package that depends on features provided by
    a virtual package to know what symbol to depend on.

The series starts with some preparatory changes and cleanups, then
introduces a way to generate different forms of tables, then goes on by
removing virtual packages from the current lists, and finally adds a new
list with the virtual packages.

Special thanks to Samuel and Maxime for their pythonistic help! :-)


Changes RFC -> v2:
  - saner API to formatter-functions
  - more classical Python constructs for dicts and lambdas
  - more accurate python-doc
  - lota typoes


Regards,
Yann E. MORIN.


The following changes since commit 8e10125d25455a734528b0a18c9bca6e5c1ba4ea:

  ti-gfx: select fbset as it is a runtime dependency (2014-06-02 22:05:23 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/manual

for you to fetch changes up to 28e1d0b8a88b0208938dcd1e0f4ed072a6e32f8b:

  docs/manual: add the virtual packages list (2014-06-02 23:04:47 +0200)

----------------------------------------------------------------
Yann E. MORIN (11):
      package/cryptodev: make it behave more like other virtual packages
      package/jpeg: make it behave more like other virtual packages
      package/mesa3d: rename the prompt
      support/scripts: prepare expanding the packages lists
      support/scripts: document args to _is_package() in gen-manual-lists
      support/scripts: prepare handling virtual packages in generated lists
      support/scripts: do not display virtual packages in generated lists
      support/scripts: who's responsible to decide what is a package
      support/scripts: introduce a symbol formatter to generate package lists
      support/scripts: generate a list of virtual packages
      docs/manual: add the virtual packages list

 docs/manual/adding-packages-directory.txt |  10 ++
 docs/manual/adding-packages-virtual.txt   |   6 +
 docs/manual/appendix.txt                  |   8 ++
 package/cryptodev/Config.in               |   4 +-
 package/jpeg/Config.in                    |   4 +-
 package/mesa3d/Config.in                  |   2 +-
 support/scripts/gen-manual-lists.py       | 220 ++++++++++++++++++++++++------
 7 files changed, 212 insertions(+), 42 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
