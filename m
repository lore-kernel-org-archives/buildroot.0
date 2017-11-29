From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:40 +0100
Subject: [Buildroot] [PATCH 0/8] Fix warnings reported by check-package
Message-ID: <cover.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes variables names as reported by check-package, to apply
our porr-man's namespace in packages.

Also fix extra lines and trailing white-spaces.

It eventually adds a gitlab-ci job to automatically run check-package,
but I suggest it is not applied because there is one false-positive
reported by check-package, on the asterisk package:

    package/asterisk/asterisk.mk:289: useless default value
    (http://nightly.buildroot.org/#_infrastructure_for_autotools_based_packages)

However, this one is about _AUTORECONF, which is inherited from target
to host variants, but for asterisk, we explcitly do not want to
autoreconf the host variant (not the same _SUBDIR tree!).


Regards,
Yann E. MORIN.


The following changes since commit 15d1962cf8b70ebcf52614301f0db242894e28a2

  ndisc6: fix bogus <pkg>_DEPENDENCIES names (2017-11-29 23:16:22 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to b9a9596c19817cf5a70c17acaa23657ed3597f01

  gitlab-ci: run check-package (2017-11-30 00:07:50 +0100)


----------------------------------------------------------------
Yann E. MORIN (8):
      package/lttng-tools: fix typo in variable name
      package/checkpolicy: rename variable
      package/am335x-pru-package: rename variable
      package/lockfile-progs: rename variable
      packages: remove "consecutive empty lines"
      packages: fix trailing spaces and slash
      package/asterisk: add comment about a check-package false positive
      gitlab-ci: run check-package

 .gitlab-ci.yml                                   | 4 ++++
 .gitlab-ci.yml.in                                | 4 ++++
 package/am335x-pru-package/am335x-pru-package.mk | 6 +++---
 package/asterisk/asterisk.mk                     | 1 +
 package/busybox/busybox.mk                       | 2 +-
 package/checkpolicy/checkpolicy.mk               | 8 ++++----
 package/lockfile-progs/lockfile-progs.mk         | 4 ++--
 package/lttng-tools/lttng-tools.mk               | 2 +-
 package/ntp/ntp.mk                               | 2 +-
 package/python3/python3.mk                       | 2 --
 package/setools/setools.mk                       | 1 -
 11 files changed, 21 insertions(+), 15 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
