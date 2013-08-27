From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:28:30 +0200
Subject: [Buildroot] [PATCHv2 0/4] Use kmod instead of module-init-tools
Message-ID: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a v2 of this patch set. Changes since the v1 are:

 * Add a patch (first patch in the series) to properly indent the
   existing KMOD_INSTALL_TOOLS macro.

 * Adjust the newly introduced host variant of kmod to only install a
   symlink for depmod, since it's the only tool that will ever be used
   in a cross-compilation context. Suggested by Arnout.

Thanks,

Thomas

Thomas Petazzoni (4):
  kmod: indent properly the KMOD_INSTALL_TOOLS macro
  kmod: allow to build a host variant
  linux: use kmod instead of module-init-tools
  module-init-tools: remove package

 Config.in.legacy                                   | 11 +++++
 linux/linux.mk                                     |  2 +-
 package/Config.in                                  |  3 --
 package/kmod/kmod.mk                               | 15 ++++++-
 package/module-init-tools/Config.in                |  9 -----
 ...nit-tools-3.15-add-manpages-config-option.patch | 47 ----------------------
 package/module-init-tools/module-init-tools.mk     | 28 -------------
 7 files changed, 25 insertions(+), 90 deletions(-)
 delete mode 100644 package/module-init-tools/Config.in
 delete mode 100644 package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
 delete mode 100644 package/module-init-tools/module-init-tools.mk

-- 
1.8.1.2
