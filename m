From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jul 2018 08:38:36 +0200
Subject: [Buildroot] [PATCH 0/5] support/docker: add new dockers
Message-ID: <cover.1531463897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Add new docker images of various distros, with the packages needed to
run Buildroot already installed.

This will help:

  - users, to get a build environment known to work,

  - developpers, to more easily reproduce build failures reported by
    users.

A basic set of a few, very various distors have been chosen, to cover
a range of diversity:

  - the existing, rock-solid Debian Stretch, pinned to a known state,
    that we use for the Gitlab-CI testing;

  - Fedora-F28, a bleeding-edge mainstream distro, pinned to the state
    it was at release time;

  - Arch 2018.07.01, a snapshot of a popular rolling-release distro;

  - Alpine 3.7, an not-so-obscur-yet-far-from-mainstream distro, which
    peculiarity is to be based on musl and busybox, instead of the more
    conventional glibc, coreutils, linux-utils, bash, et al...

More variants can be added later, depending on the demand.

Note 1: when this series is applied (if it is), I'll generate the images
and push them to the Buildroot repo on the Docker hub.

Note 2: in the first patch, I am absoutely sure we can bike-shed at
length on the rule name. Shoot! ;-)


Regards,
Yann E. MORIN.


The following changes since commit bf79731153d2739580954161547225acb60f65e8

  libcurl: security bump to version 7.61.0 (2018-07-12 22:18:54 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 9f99ad9f8d86876a7e16185a9025223bc01edf9d

  support/docker: add an Alpine-3.7 based image (2018-07-13 08:35:08 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      core: add a rule to generate all our docker images
      support/docker: rename the Dockerfile and its accompanying file
      support/docker: add a Fedore-28 based image
      support/docker: add an Arch image
      support/docker: add an Alpine-3.7 based image

 Makefile                                           | 13 ++++++
 support/docker/Dockerfile.alpine-3.7               | 42 +++++++++++++++++++
 support/docker/Dockerfile.arch-2018.07.01          | 40 ++++++++++++++++++
 support/docker/Dockerfile.base                     |  1 +
 .../{Dockerfile => Dockerfile.debian-stretch}      |  7 +++-
 support/docker/Dockerfile.fedora-28                | 48 ++++++++++++++++++++++
 ...ources.list => debian-stretch.apt-sources.list} |  0
 7 files changed, 149 insertions(+), 2 deletions(-)
 create mode 100644 support/docker/Dockerfile.alpine-3.7
 create mode 100644 support/docker/Dockerfile.arch-2018.07.01
 create mode 120000 support/docker/Dockerfile.base
 rename support/docker/{Dockerfile => Dockerfile.debian-stretch} (87%)
 create mode 100644 support/docker/Dockerfile.fedora-28
 rename support/docker/{apt-sources.list => debian-stretch.apt-sources.list} (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
