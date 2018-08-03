From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Aug 2018 22:16:50 +0200
Subject: [Buildroot] [PATCH 0/3 v3] core/pkg-kconfig: ensure we have
 necessary tools to run configurators
Message-ID: <cover.1533327111.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Recent version of the linux kernel introduced major changes in the
kconfig infrastructure.

Starting with linux-4.16, the kconfig parser code is no longer shipped
with the linux source tree, and mut be generated from the lex/yacc
parser sources.

Similarly, starting with linux-4.18, the kconfig infra allows calling
back to the shell to run various commands, especially calling to the
compiler to test its features (and hide/show options accordingly).

So, we need to ensure the appropriate tools are available before we
attempt to run any of the configurators.

This three-fold series firs introduces the necessary chjanges in the
kconfig infrastructure, so that packages can specify dependencies to be
built and installed before the configurators are run.

Then, the linux package is fixed to take advantage of that forits
dependencies on host-flex and host-bison.

Finally, the linux package is also fixed to guarantee the toolchain is
available for the configurators.

Changes v2 -> v3:
  - drop append-assignment in patch 2

Changes v1 -> v2:
  - introduce the KCONFIG_DEPENDENCIES in the kconfig-package infra
    (Thomas)
  - change linux to take advantage of that  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 81ea4a243b63d7bb1fec580910c553af4ae072c1

  package/lttng-tools: bump version to 2.10.5 (2018-08-01 14:28:30 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 5878b50c7b69951bc528d25c98a691a888ee5051

  linux: kconfig needs the toolchain (2018-08-03 22:02:18 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      core/pkg-kconfig: allow dependencies before configurators
      linux: kconfig needs host-{flex,bison} to build the configurators
      linux: kconfig needs the toolchain

 docs/manual/adding-packages-kconfig.txt |  4 ++++
 linux/linux.mk                          | 11 ++++++++++-
 package/pkg-kconfig.mk                  |  9 +++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
