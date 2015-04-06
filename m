From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:57:10 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: fix legal-info
Message-ID: <20150406085715.5BF968197C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b85a6b34641ef4749ab6906383f858075c05041
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a bunch of deficiencies:
  - 'debian/copyright' does not exist.
  - gnuefi is not GPLv2+. Only one AArch64 file has GPLv2+ headers,
    all others have BSD-3c
  - efilib is BSD-2c

Change the licensing information to include BSD-3c for the gnuefi parts,
and keep refernce to GPLv2+ as the Main README.gnuefi references it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnu-efi/gnu-efi.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 0e067a6..a11ff81 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -8,8 +8,8 @@ GNU_EFI_VERSION = 3.0.1
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
-GNU_EFI_LICENSE_FILES = debian/copyright
+GNU_EFI_LICENSE = BSD-3c and/or GPLv2+ (gnuefi), BSD-3c (efilib)
+GNU_EFI_LICENSE_FILES = README.efilib
 
 # gnu-efi is a set of library and header files used to build
 # standalone EFI applications such as bootloaders. There is no point
