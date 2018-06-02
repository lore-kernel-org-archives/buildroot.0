From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 00:19:31 +0200
Subject: [Buildroot] [PATCH 0/4] support/docker: make the image more
 reproducible
Message-ID: <cover.1527977964.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, the base test image is not entirely reproducible, because we
install packages from PyPI without specifying all the versions of all
the packages we install from there.

Instead of relying on a third-party to provide packages, just use those
from te distribution, because we are using a pinned version and thus we
will always get the same packages from the distro.


Regards,
Yann E. MORIN.


The following changes since commit 6a29c8ae3ee2f2ef1a7bdac48fa96d29d9e9b62f

  librsync: bump to version 2.0.2 (2018-06-02 16:06:02 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ff32083db8641c38fa6d02f731870583b24c4dab

  support/docker: use the distro-provided flake8 (2018-06-02 23:27:15 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      support/docker: run apt-get update and apt-get install in two RUNs
      support/docker: sort the list of installed packages
      support/testing: fix python syntax
      support/docker: use the distro-provided flake8

 support/docker/Dockerfile         | 40 +++++++++++++++++++++++----------------
 support/testing/infra/__init__.py |  6 +++---
 support/testing/infra/basetest.py |  4 ++--
 3 files changed, 29 insertions(+), 21 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
