From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu,  1 Jan 2015 21:54:36 +0100
Subject: [Buildroot] [PATCH v2 0/2] Portability fixes for "make menuconfig"
Message-ID: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here are two portability fixes needed to be able to run "make menuconfig" on
NixOS[1].

[1]: http://nixos.org/

Bj?rn Forsman (2):
  kconfig/lxdialog: get ncurses CFLAGS with pkg-config
  Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time

 Makefile                                           |  6 ++-
 ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch | 50 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch

-- 
Changes v1 -> v2:
  - make the kconfig/lxdialog patch a separate patch file, instead of modifying
    the kconfig sources (which are synced with linux from time to time).
    Suggested by Thomas P.
