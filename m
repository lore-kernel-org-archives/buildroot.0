From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:00:58 +0200
Subject: [Buildroot] [PATCH 0/6] Cleanup of packages patching
Message-ID: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In preparation for the out-of-tree support, it is important that the
source tree for the host and target variants are the same. I conducted
an analysis by listing all packages that had both a target and host
variants, but that were using a different combination of post-extract
or post-patch hooks for their host and target variants.

This patch set fixes such packages, which will make things easier in
the future to introduce the out-of-tree support.

Best regards,

Thomas

Thomas Petazzoni (6):
  bzip2: improve the packaging
  gettext: don't patch different the host and target build
  binutils: apply post-patch hook on both the host and target builds
  gutenprint: ensure target and host variant have the same patch hooks
  libgtk2: remove useless post-patch hook
  xlib_libX11: ensure target and host variant have the same patch hooks

 package/binutils/binutils.mk                       |    1 +
 package/bzip2/bzip2-improve-build-system.patch     |   84 ++++++++++++++++++
 package/bzip2/bzip2.mk                             |   92 +++++++-------------
 ...patch => gettext-01-error_print_progname.patch} |    0
 ...patch => gettext-02-fix_rpl_gettimeofday.patch} |    0
 .../gettext-03-option-to-disable-tools.patch       |   42 +++++++++
 .../gettext/gettext-04-remove-examples-tests.patch |   20 +++++
 package/gettext/gettext-05-use-shell.patch         |   25 ++++++
 package/gettext/gettext.mk                         |   26 +++---
 package/gutenprint/gutenprint.mk                   |    1 +
 package/libgtk2/libgtk2.mk                         |    6 --
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    1 +
 12 files changed, 219 insertions(+), 79 deletions(-)
 create mode 100644 package/bzip2/bzip2-improve-build-system.patch
 rename package/gettext/{gettext-error_print_progname.patch => gettext-01-error_print_progname.patch} (100%)
 rename package/gettext/{gettext-fix_rpl_gettimeofday.patch => gettext-02-fix_rpl_gettimeofday.patch} (100%)
 create mode 100644 package/gettext/gettext-03-option-to-disable-tools.patch
 create mode 100644 package/gettext/gettext-04-remove-examples-tests.patch
 create mode 100644 package/gettext/gettext-05-use-shell.patch

-- 
1.7.9.5
