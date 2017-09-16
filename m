From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Sep 2017 22:38:16 +0200
Subject: [Buildroot] [PATCH 0/2] support/run-test: move pacakges' tests to
	packages' directories
Message-ID: <cover.1505594291.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

It looks more logical to have packages' tests right next to the packages
own descriptions, side by side with the Config.in and the .mk files.

If this solution is accepted, then it will also allow to easily add
tests directly in the filesystems and boot directories.


Regards,
Yann E. MORIN.


The following changes since commit c665c7c9cd6646b135cdd9aa7036809f7771ab80

  netsnmp: install all MIB files (2017-09-13 23:23:40 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 5d8ea4ebb51023d3943fb4e5a1678f8cfba70527

  testing: add python-cryptography tests (2017-09-16 22:20:52 +0200)


----------------------------------------------------------------
Yann E. MORIN (1):
      support/run-tests: move packages tests to packages directories

Yegor Yefremov (1):
      testing: add python-cryptography tests

 .gitignore                                         |  1 +
 .gitlab-ci.yml                                     |  2 ++
 .../dropbear/dropbear.py                           |  0
 package/python-cryptography/python-cryptography.py | 31 ++++++++++++++++++++++
 .../python-ipython/python-ipython.py               |  0
 .../test_python.py => package/python/python.py     |  0
 support/testing/run-tests                          | 22 +++++++++++++++
 support/testing/tests/package/__init__.py          |  0
 8 files changed, 56 insertions(+)
 rename support/testing/tests/package/test_dropbear.py => package/dropbear/dropbear.py (100%)
 create mode 100644 package/python-cryptography/python-cryptography.py
 rename support/testing/tests/package/test_ipython.py => package/python-ipython/python-ipython.py (100%)
 rename support/testing/tests/package/test_python.py => package/python/python.py (100%)
 delete mode 100644 support/testing/tests/package/__init__.py

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
