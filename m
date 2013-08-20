From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:05:39 +0200
Subject: [Buildroot] [PATCH 0/3] Replace module-init-tools by kmod
Message-ID: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of three patches that replace module-init-tools by kmod,
since module-init-tools has been deprecated upstream.

kmod is already packaged, but we had a host variant (in patch 1) so
that the Linux kernel build logic can use it (patch 2), and finally we
remove the module-init-tools package and add the corresponding
Config.in.legacy entries (patch 3).

This is intended for 2013.11.

Thomas

Thomas Petazzoni (3):
  kmod: allow to build a host variant
  linux: use kmod instead of module-init-tools
  module-init-tools: remove package

 Config.in.legacy                                   | 11 +++++
 linux/linux.mk                                     |  2 +-
 package/Config.in                                  |  3 --
 package/kmod/kmod.mk                               |  9 +++++
 package/module-init-tools/Config.in                |  9 -----
 ...nit-tools-3.15-add-manpages-config-option.patch | 47 ----------------------
 package/module-init-tools/module-init-tools.mk     | 28 -------------
 7 files changed, 21 insertions(+), 88 deletions(-)
 delete mode 100644 package/module-init-tools/Config.in
 delete mode 100644 package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
 delete mode 100644 package/module-init-tools/module-init-tools.mk

-- 
1.8.1.2
