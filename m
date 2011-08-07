From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun,  7 Aug 2011 22:37:56 +0200
Subject: [Buildroot] [PATCH 0/2] toolchain: update the crosstool-NG backend,
	v2
Message-ID: <1312749478-10361-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patchset updates the crosstool-NG backend to the newly released 1.12.0.
Existing patches were applied upstream, and are no longer needed. A new patch
is added because it works around a limitation specific to buildroot; it will
not go upstream as-is, a better fix will have to be found.

Changes since v1:
- simply get rid of the recursion test, it can't happen (Peter)

    [PATCH 1/2] toochain/crosstool-NG: bump version
    [PATCH 2/2] toolchain/crosstool-NG: update bundled config files

 .../crosstool-ng-000-makefile-recursion.patch      |   39 ++++
 package/crosstool-ng/crosstool-ng-001-no-cvs.patch |   15 --
 ...-break-on-existing-symlinks-and-build.log.patch |   76 -------
 .../crosstool-ng-003-autostuf-compat.patch         |   10 -
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 .../crosstool-ng.config-eglibc                     |  227 ++++++-------------
 .../crosstool-ng.config-glibc                      |  234 ++++++--------------
 .../crosstool-ng.config-uClibc                     |  192 ++++------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 9 files changed, 221 insertions(+), 576 deletions(-)

Regards,
Yann E. MORIN.
