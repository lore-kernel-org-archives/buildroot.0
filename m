From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:01:04 +0100
Subject: [Buildroot] [PATCH 0/3] uclibc: add support for uClibc-ng
Message-ID: <1423947668-23312-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The following three set of patches add support for uClibc-ng. The main
patch is based on previous work from Waldemar (thanks!).

I have build tested and runtime tested in Qemu the following
configurations: ARM Cortex-A9 EABIhf (qemu-vexpress) and Xtensa NPTL
(qemu emulation). The build includes the toolchain, Busybox and the
kernel.

Thomas

Thomas Petazzoni (3):
  uclibc: cleanup handling of ARC uClibc version
  uclibc: add ability to use uClibc-ng 1.0.0
  uclibc: enable Xtensa NPTL support with uClibc-ng

 package/uclibc/Config.in              |  17 ++-
 package/uclibc/uClibc-ng-1.0.0.config | 280 ++++++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk              |  21 ++-
 3 files changed, 314 insertions(+), 4 deletions(-)
 create mode 100644 package/uclibc/uClibc-ng-1.0.0.config

-- 
2.1.0
