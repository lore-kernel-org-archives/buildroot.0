From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  7 Mar 2014 14:22:11 +0100
Subject: [Buildroot] [PATCH v3 0/3] improve virtual package management
Message-ID: <1394198534-16379-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series improves virtual package management by:

- using make control functions in dependency check.
- adding a tutorial to the user manual.

Changes v2 -> v3:
  - rebased on master.
  - removed already converted packages (lua, libegl, ...).
  - converted cryptodev and jpeg (reported by Yann E. Morin).
  - fixed comments on virtual package provider *.mk not being in the correct
    section of tutorial (reported by S. Martin).

Changes v1 -> v2:
  - rebased on master.
  - replaced 'infrastructure' by 'management' as this mechanism does not (yet?)
    provide a "$(eval $(virtual-package))" helper
  - converted code examples to plain sections (suggested by Yann E. Morin).

Best regards,
ELB

Eric Le Bihan (3):
  manual: add virtual package tutorial.
  cryptodev: convert to new virtual package management.
  jpeg: convert to new virtual package management.

 docs/manual/adding-packages-virtual.txt |   97 +++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |    2 +
 package/cryptodev/Config.in             |    3 +
 package/cryptodev/cryptodev.mk          |    7 +--
 package/jpeg/Config.in                  |    3 +
 package/jpeg/jpeg.mk                    |    7 +--
 6 files changed, 111 insertions(+), 8 deletions(-)
 create mode 100644 docs/manual/adding-packages-virtual.txt

-- 
1.7.9.5
