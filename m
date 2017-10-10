From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Oct 2017 22:43:27 +0200
Subject: [Buildroot] [RFC 0/3] Adding software stacks
Message-ID: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Software stacks are a way to define a group of options that should be used together and they are orthogonal to configs: a software stack can indeed be shared among several configs.

Having a stack system like the one envisioned in this patch series make possible to do something like this:

make imx6-sabresd_defconfig; make mesa3d-etnaviv_stack qt5-fb_stack qt5-demos_stack; make

In this way we can declutter redundant configs (ex: imx6-sabresd_qt5_defconfig) and decouple software packages side releated symbols from hardware related defconfigs.


Angelo Compagnucci (3):
  support/kconfig/merge_config.sh: merge also buildroot config files
  Makefile: add handling of software stacks
  stacks: add a bunch of stacks

 Makefile                        | 40 ++++++++++++++++++++++++++++++++++++++--
 stacks/lamp_stack               | 10 ++++++++++
 stacks/mesa3d-etnaviv_stack     |  7 +++++++
 stacks/qt5-demos_stack          |  7 +++++++
 stacks/qt5-fb_stack             | 11 +++++++++++
 support/kconfig/merge_config.sh | 16 +++++++++++++++-
 6 files changed, 88 insertions(+), 3 deletions(-)
 create mode 100644 stacks/lamp_stack
 create mode 100644 stacks/mesa3d-etnaviv_stack
 create mode 100644 stacks/qt5-demos_stack
 create mode 100644 stacks/qt5-fb_stack

-- 
2.7.4
