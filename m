From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:03:08 +0100
Subject: [Buildroot] [PATCH 0/4] vpnc: update and fix musl build
Message-ID: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The starting point of this series was the patch from Bernd fixing the
vpnc package to build with musl:

  http://patchwork.ozlabs.org/patch/572246/

However, I was not very happy with the patches directly imported from
Alpine Linux, with no real commit log, no explanation, etc.

So instead, I went ahead and updated the vpnc package to use a more
recent upstream version, to reformat all the patches using Git, to
re-organize the existing patches into cleaner ones, and rework the
musl fixes into clean patches as well.

All patches have been submitted upstream:

  https://github.com/ndpgroup/vpnc/pull/6

It isn't entirely clear how this Github repository gets maintained
compared to the Subversion repository mentioned on the official vpnc
homepage, but it seems to be kept reasonably up-to-date.

Thanks,

Thomas

Thomas Petazzoni (4):
  vpnc: switch to github as the new site
  vpnc: simplify patch 0001
  vpnc: bump to newer upstream version
  vpnc: add patches to fix build with the musl C library

 ...ile-allow-to-override-the-PREFIX-variable.patch | 32 ++++++++++
 package/vpnc/0001-fix-build.patch                  | 71 ----------------------
 ...02-Makefile-allow-to-override-the-version.patch | 42 +++++++++++++
 package/vpnc/0002-nomanual.patch                   | 15 -----
 ...file-allow-passing-custom-CFLAGS-CPPFLAGS.patch | 46 ++++++++++++++
 package/vpnc/0003-susv3-legacy.patch               | 12 ----
 ...e-provide-an-option-to-not-build-manpages.patch | 58 ++++++++++++++++++
 ...low-passing-a-custom-path-to-libgcrypt-co.patch | 41 +++++++++++++
 ...place-deprecated-SUSv3-functions-with-POS.patch | 37 +++++++++++
 ...n-t-assume-error.h-is-available-on-all-Li.patch | 54 ++++++++++++++++
 ...p.c-don-t-include-linux-if_tun.h-on-Linux.patch | 56 +++++++++++++++++
 ...g.c-add-missing-sys-ttydefaults.h-include.patch | 38 ++++++++++++
 package/vpnc/Config.in                             |  6 ++
 package/vpnc/vpnc.hash                             |  2 +-
 package/vpnc/vpnc.mk                               | 19 +++---
 15 files changed, 420 insertions(+), 109 deletions(-)
 create mode 100644 package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch
 delete mode 100644 package/vpnc/0001-fix-build.patch
 create mode 100644 package/vpnc/0002-Makefile-allow-to-override-the-version.patch
 delete mode 100644 package/vpnc/0002-nomanual.patch
 create mode 100644 package/vpnc/0003-Makefile-allow-passing-custom-CFLAGS-CPPFLAGS.patch
 delete mode 100644 package/vpnc/0003-susv3-legacy.patch
 create mode 100644 package/vpnc/0004-Makefile-provide-an-option-to-not-build-manpages.patch
 create mode 100644 package/vpnc/0005-Makefile-allow-passing-a-custom-path-to-libgcrypt-co.patch
 create mode 100644 package/vpnc/0006-config.c-Replace-deprecated-SUSv3-functions-with-POS.patch
 create mode 100644 package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch
 create mode 100644 package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch
 create mode 100644 package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch

-- 
2.6.4
