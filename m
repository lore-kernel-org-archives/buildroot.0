From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon,  7 Apr 2014 12:00:20 +0100
Subject: [Buildroot] [PATCH 0/2] Add lightweight Zile editor
Message-ID: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex Benn?e <alex@bennee.com>

Hi,

The following two patches enable the addition of Zile to the roster of
available editors in buildroot. Zile is a lightweight Emacs-a-like
implementation. It requires libgc which will also be useful for a
number of other packages if they get added to Buildroot. There is
nothing especially complex in the build descriptions although libgc
requires another source tree (lib_atomic) merging in the build and
Zile needs help2man disabling.

Cheers,

--
Alex Benn?e
QEMU/KVM Hacker for Linaro


Alex Benn?e (2):
  package/libgc: add Boehm-Demers-Weiser gc library
  package/zile: add Zile is Lossy Emacs editor

 package/Config.in                  |  2 ++
 package/libgc/Config.in            |  9 +++++++++
 package/libgc/libgc.mk             | 23 +++++++++++++++++++++++
 package/zile/Config.in             | 14 ++++++++++++++
 package/zile/remove-help2man.patch | 28 ++++++++++++++++++++++++++++
 package/zile/zile.mk               | 13 +++++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/libgc/Config.in
 create mode 100644 package/libgc/libgc.mk
 create mode 100644 package/zile/Config.in
 create mode 100644 package/zile/remove-help2man.patch
 create mode 100644 package/zile/zile.mk

-- 
1.9.1
