From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 10:18:43 +0200
Subject: [Buildroot] [PATCH v2 0/4] Host-package: RPATH fixup
Message-ID: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2nd round for this short series, but this time with a python
implementation leveraging patchelf to fix RPATH.

This is a first step for a relocatable SDK, that allows to relocate
the toolchain (and only the toolchain), without any patch in the
toolchain packages.

These changes add hooks to target-finalize that fix the RPATHs in the
host tree, and clear those in the target tree.

Bonus, the staging symlink now uses relative path. ;-)

Regards,

Samuel Martin (4):
  support/scripts: add fix_rpaths
  package/patchelf: add HOST_FIX_RPATH_HOOK to TARGET_FINALIZE_HOOKS
  package/patchelf: add TARGET_CLEAR_RPATH_HOOK to TARGET_FINALIZE_HOOKS
  Makefile: staging symlink uses a relative path

 Makefile                     |   2 +-
 package/patchelf/patchelf.mk |  20 +++
 support/scripts/fix_rpaths   | 302 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100755 support/scripts/fix_rpaths

--
2.4.5
