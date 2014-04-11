From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 11 Apr 2014 15:05:53 +0100
Subject: [Buildroot] [PATCH 0/3] Add lightweight Zile editor
Message-ID: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've updated the patches based on review comments. There is a new
patch just to enable the existing libatmomic to be built for aarch64
(the platform I'm testing on). As a result the ugly hackage in the gc
library build has gone away.

Cheers,

--
Alex Benn?e
QEMU/KVM Hacker for Linaro


Alex Benn?e (3):
  package/libatomic: mark as supporting aarch64
  package/libgc: add Boehm-Demers-Weiser gc library
  package/zile: add Zile is Lossy Emacs editor

 package/Config.in                  |  2 ++
 package/libatomic_ops/Config.in    |  2 +-
 package/libgc/Config.in            | 10 ++++++++++
 package/libgc/libgc.mk             | 15 +++++++++++++++
 package/zile/Config.in             | 13 +++++++++++++
 package/zile/remove-help2man.patch | 30 ++++++++++++++++++++++++++++++
 package/zile/zile.mk               | 14 ++++++++++++++
 7 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 package/libgc/Config.in
 create mode 100644 package/libgc/libgc.mk
 create mode 100644 package/zile/Config.in
 create mode 100644 package/zile/remove-help2man.patch
 create mode 100644 package/zile/zile.mk

-- 
1.9.2
