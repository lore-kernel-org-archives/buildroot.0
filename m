From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 May 2011 00:05:39 +0200
Subject: [Buildroot] [PATCH 0/3 v2] toolchain/crosstool-NG: update to 1.11.3,
	use sane defaults
Message-ID: <1306015542-5208-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patchset updates the crosstool-NG backend.

Changes since previous post:
- fixed a typo, missing termintaing quote, patch 1
- updating to 1.11.3 also updates the bundled config files, patch 2
- trailing space removed, patch 3

The typo was due to an un-refreshed patch. Sorry about it.

  [PATCH 1/3] toolchain/crosstool-NG: bundle one CT-NG config file for each libc familly
  [PATCH 2/3] toolchain/crosstool-NG: update to 1.11.3
  [PATCH 3/3] toolchain/crosstool-NG: fix up ct-ng config file to saner defaults

 .../002-no-sysroot-prompt-in-backend.patch         |   12 -
 toolchain/toolchain-crosstool-ng/Config.in         |   11 +-
 ...sstool-ng.config => crosstool-ng.config-eglibc} |  233 +++++++++++++++-----
 ...osstool-ng.config => crosstool-ng.config-glibc} |  230 +++++++++++++++-----
 ...sstool-ng.config => crosstool-ng.config-uClibc} |  209 +++++++++++++-----
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   32 +++-
 6 files changed, 534 insertions(+), 193 deletions(-)

Regards,
Yann E. MORIN.
