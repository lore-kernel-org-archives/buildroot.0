From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Apr 2015 23:55:34 +0200
Subject: [Buildroot] [PATCH 0/1] Added linux drivers backports project
Message-ID: <1429134935-11241-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

this is a patch adding [1] to buildroot. Backports provide drivers released on
newer kernels backported for usage on older kernels. This is very handy, for
those which have to use and old kernel (some SoC requires this).

This project was discussed more than one year ago [2], but nothing was actually
implemented.

I plan further improvements:

* Allow to use different versions
There are stable releases, snapshot based on current linux-next and some
archived versions based on linux-next. Although it's recommended to use the
latest stable version, some people prefer / need different version.

* Version check
For kernel versions older than 3.0 version backports-3.14 is needed,
kernels < 2.6.26 aren't supported.

* Custom patches
Ekvivalent of BR2_LINUX_KERNEL_PATCH.

* Custom repository version
Ekvivalent of BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION.

Credits: I got inspired by implementation in gfiber project (but rewrited).

Kind regards,
Petr


[1] https://backports.wiki.kernel.org
[2] http://lists.busybox.net/pipermail/buildroot/2013-December/084663.html
[3] https://gfiber.googlesource.com/buildroot/+/gfiber-openbox-2/package/backports/backports.mk

Petr Vorel (1):
  Added linux drivers backports project

 package/Config.in                            |  1 +
 package/linux-backports/Config.in            | 36 ++++++++++++++
 package/linux-backports/linux-backports.hash |  2 +
 package/linux-backports/linux-backports.mk   | 73 ++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 package/linux-backports/Config.in
 create mode 100644 package/linux-backports/linux-backports.hash
 create mode 100644 package/linux-backports/linux-backports.mk

-- 
1.8.0
