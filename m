From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:08 +0100
Subject: [Buildroot] Refactor handling of the version string
Message-ID: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patchset computes a universally-available version string for packages
to use.

The so-available version string contains the current buildroot version,
and if the local buildroot tree is a git clone, then a git signature is
appended.

Converted users:
- menuconfig, to show the version in the main title, and save the
  version string in the commented headers of .config
- /etc/br-version on the target
- toolchains will push that version string in the gcc pkg-version

    [PATCH 1/8] Makefile: move .NOTPARALLEL
    [PATCH 2/8] Makefile: move version string from Config.in into Makefile
    [PATCH 3/8] package/config: update quilt series
    [PATCH 4/8] Makefile: compute the version string for all to use
    [PATCH 5/8] Makefile: use global version string in /etc/br-version
    [PATCH 6/8] config: use global version string
    [PATCH 7/8] toolchain/internal: use global BR2 version string for gcc version string
    [PATCH 8/8] toolchain/crosstool-ng: use global BR2 version string

Regards,
Yann E. MORIN.
