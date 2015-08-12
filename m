From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Aug 2015 01:19:59 +0300
Subject: [Buildroot] [PATCH 0/4] xtensa: toolchain fix for compiling huge
	functions
Message-ID: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

this series backports binutils and gcc patches that add auto-litpools option
and replaces text-section-literals ABI flag for xtensa with auto-litpools.
With that change compiling huge functions should no longer be an issue on
xtensa. Obviously that change will break builds with pre-built toolchain.

Max Filippov (4):
  binutils: backport auto-litpools xtensa gas option
  gcc: backport mauto-litpools xtensa option
  xtensa: switch from text-section-literals to auto-litpools
  Revert "opencv: mark as not available on Xtensa"

 package/Makefile.in                                |   4 +-
 .../2.24/913-xtensa-add-auto-litpools-option.patch | 698 ++++++++++++++++++++
 .../913-xtensa-add-auto-litpools-option.patch      | 699 +++++++++++++++++++++
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
 package/gcc/gcc.mk                                 |   6 +-
 package/opencv/Config.in                           |   3 -
 8 files changed, 2272 insertions(+), 8 deletions(-)
 create mode 100644 package/binutils/2.24/913-xtensa-add-auto-litpools-option.patch
 create mode 100644 package/binutils/2.25.1/913-xtensa-add-auto-litpools-option.patch
 create mode 100644 package/gcc/4.8.5/870-xtensa-add-mauto-litpools-option.patch
 create mode 100644 package/gcc/4.9.3/870-xtensa-add-mauto-litpools-option.patch
 create mode 100644 package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch

-- 
1.8.1.4
