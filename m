From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 29 Oct 2018 00:09:49 +0100
Subject: [Buildroot] [PATCH 0/3] Kconfig fixes
Message-ID: <20181028230952.27293-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here are fixes of my last kconfig update.
6eacea5ae0 ("support/kconfig: bump to kconfig from Linux 4.17-rc2")

I left patch 17-backport-kecho.patch from v3 which got merged
and I accidentally deleted 2 changes which didn't have patches.

Erico, thanks for reporting bug.
Sorry for mistakes.


Kind regards,
Petr

Petr Vorel (3):
  kconfig: Add missing patch
  kconfig: Restore missing custom changes + add patches
  kconfig: Refresh patches

 support/kconfig/merge_config.sh               | 10 +++-
 .../01-kconfig-kernel-to-buildroot.patch      | 14 +++---
 .../06-br-build-system-integration.patch      | 14 +++---
 .../14-support-out-of-tree-config.patch       |  2 +-
 .../kconfig/patches/17-backport-kecho.patch   | 26 ++++++++++
 ...fig.sh-create-temporary-files-in-tmp.patch | 27 +++++++++++
 ...e_config.sh-add-br2-external-support.patch | 47 +++++++++++++++++++
 support/kconfig/patches/series                |  2 +
 8 files changed, 125 insertions(+), 17 deletions(-)
 create mode 100644 support/kconfig/patches/17-backport-kecho.patch
 create mode 100644 support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
 create mode 100644 support/kconfig/patches/19-merge_config.sh-add-br2-external-support.patch

-- 
2.19.1
