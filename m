From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Apr 2021 22:21:51 +0200
Subject: [Buildroot] [PATCH 0/4] Misc shim related fixes/bumps
Message-ID: <20210405202155.1422470-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

While looking at the CVEs for shim, I found out that we were not using
the latest version. And while bumping, I found out that even the
current version doesn't build with recent compiler versions.

PATCH 1/4 and 2/4 fix build issues by backporting upstream
patches. Those patches are already in the newer 15.4, but for the sake
of backporting to 2021.02, it felt better to have them as separate
fixes first. PATCH 3/4 does the 15.4 bump, and PATCH 4/4 re-enables on
ARM32.

Note that I don't have any particular interest in shim, so this has
only been build tested (arm32, arm64 and x86-64).

Thomas

Thomas Petazzoni (4):
  boot/shim: fix build issue due to gnu-efi
  boot/shim: fix build issues with gcc 9.x
  boot/shim: bump to version 15.4
  boot/shim: re-enable on ARM32

 boot/shim/Config.in |  4 +---
 boot/shim/shim.hash |  2 +-
 boot/shim/shim.mk   | 11 ++++-------
 3 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.30.2
