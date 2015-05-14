From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 May 2015 07:38:58 +0300
Subject: [Buildroot] [PATCH 0/2] binutils: fix xtensa ld bug triggered by
	--gc-sections
Message-ID: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series backports binutils fix for xtensa ld and reverts old workaround
for this bug.

Max Filippov (2):
  binutils: fix xtensa ld bug triggered by --gc-sections
  Revert "kmod: disable --gc-sections ld option when building for
    xtensa"

 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 package/kmod/kmod.mk                               |  5 --
 5 files changed, 228 insertions(+), 5 deletions(-)
 create mode 100644 package/binutils/2.22/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.24/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch

-- 
1.8.1.4
