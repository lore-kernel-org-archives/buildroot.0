From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 11:08:19 +0200
Subject: [Buildroot] [PATCH 0/5] support/docker: make the image more
 reproducible
Message-ID: <cover.1528016895.git.yann.morin.1998@free.fr>
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
from the distribution, because we are using a pinned version and thus
we will always get the same packages from the distro.

Eventually, we also update to a python3-flavoured flake8, as that
catches even more issues. Those issues are also fixed. Note that, even
if we decide against switching to a python3 flake8, we can still apply
patch 4, to fix the issues that it reported.

The result of using this series can be seen at:
    https://gitlab.com/ymorin/buildroot-ci/pipelines/23095050

If/when this series is applied, I'll regenerate and updalod the new
buildroot/base image, and send a furhter patch to use it from our
gitlab-ci.yml.


Regards,
Yann E. MORIN.


The following changes since commit 6a29c8ae3ee2f2ef1a7bdac48fa96d29d9e9b62f

  librsync: bump to version 2.0.2 (2018-06-02 16:06:02 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to ed69b61801983e7f424b062eb586669b6d59a969

  support/docker: update to python3-flavoured flake8 (2018-06-03 10:55:23 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      support/docker: run apt-get update and apt-get install in two RUNs
      support/docker: sort the list of installed packages
      support/docker: use the distro-provided flake8
      support/testing: fix python syntax
      support/docker: update to python3-flavoured flake8

 .gitlab-ci.yml                    |  2 +-
 .gitlab-ci.yml.in                 |  2 +-
 support/docker/Dockerfile         | 40 +++++++++++++++++++++++----------------
 support/testing/infra/__init__.py |  6 +++---
 support/testing/infra/basetest.py |  4 ++--
 support/testing/run-tests         | 26 ++++++++++++-------------
 6 files changed, 44 insertions(+), 36 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
