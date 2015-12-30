From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 30 Dec 2015 16:05:24 +0200
Subject: [Buildroot] [PATCH 0/3] vboot-utils fixes
Message-ID: <cover.1451483256.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vboot-utils depend on relatively recent host kernel headers,
and fail to build on some of the autobuilders.

MTD_CHAR_MAJOR definition appears in linux-3.13, and ssize_t related
failures probably happen with glibc from the same timeframe.

Sadly I cannot check it properly, I can only tell it does not break
builds on newer systems. If possible, please try them on some older
systems before applying.

If everything works well, I'd try to send 0002 upstream, but probably not 0001.
It's an ugly fix and I don't think upstream cares much about older kernels.

  vboot-utils: MTD_CHAR_MAJOR definition
  vboot-utils: ssize_t needs unistd.h
  vboot-utils: remove hash file

 package/vboot-utils/0001-mtd-char-major.patch | 17 +++++++++++++++++
 package/vboot-utils/0002-ssize-t.patch        | 14 ++++++++++++++
 package/vboot-utils/vboot-utils.hash          |  2 --
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/vboot-utils/0001-mtd-char-major.patch
 create mode 100644 package/vboot-utils/0002-ssize-t.patch
 delete mode 100644 package/vboot-utils/vboot-utils.hash

-- 
2.6.4
