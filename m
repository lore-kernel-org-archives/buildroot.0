From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 23:41:37 +0200
Subject: [Buildroot] [PATCH 0/4 v2] support/docker: add new dockers (branch
 yem/dockers)
Message-ID: <cover.1589751688.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Enhance our docker support, update the existing image, add a new one.

This will help:

  - users, to get a build environment known to work,

  - developpers, to more easily reproduce build failures reported by
    users.

A basic set of a few, very various distros have been chosen, to cover
a range of diversity:

  - the existing, rock-solid Debian Stretch, pinned to a known state,
    that we use for the Gitlab-CI testing;

  - Fedora-F32, a bleeding-edge mainstream distro, pinned to the state
    it was at release time;

More variants can be added later, depending on the demand.

Note: when this series is applied (if it is), I'll generate the images
and push them to the Buildroot repo on the Docker hub.

Changes v1 -> v2:
  - reorder patches to ensure bisectability  (Ricardo)
  - drop the Makefile rule in favour of a script
  - drop Arch and Alpine for now...


Regards,
Yann E. MORIN.


The following changes since commit 53158e41fdd4bcc1272bbf4e61b68f58bf9c1527

  package/openocd: fix -fno-common build failure (2020-05-17 21:50:04 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 48c45cb866a160ce4cc05b03fdf15237eb346b66

  support/docker: add a Fedore-32 based image (2020-05-17 23:31:36 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      support/docker: rename the Dockerfile and its accompanying file
      support/docker: add script to generate docker iamges
      support/docker: allow the br-user to becone root
      support/docker: add a Fedore-32 based image

 support/docker/Dockerfile.base                     |  1 +
 .../{Dockerfile => Dockerfile.debian-stretch}      | 12 ++++--
 support/docker/Dockerfile.fedora-32                | 48 ++++++++++++++++++++++
 support/docker/build-all                           | 17 ++++++++
 ...ources.list => debian-stretch.apt-sources.list} |  0
 5 files changed, 75 insertions(+), 3 deletions(-)
 create mode 120000 support/docker/Dockerfile.base
 rename support/docker/{Dockerfile => Dockerfile.debian-stretch} (80%)
 create mode 100644 support/docker/Dockerfile.fedora-32
 create mode 100755 support/docker/build-all
 rename support/docker/{apt-sources.list => debian-stretch.apt-sources.list} (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
