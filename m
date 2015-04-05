From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:26 +0200
Subject: [Buildroot] [PATCH 5/6] package/gnu-efi: fix legal-info
In-Reply-To: <cover.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <41ea946a815b2214044827c73815d8a171a3a939.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a bunch of deficiencies:
  - 'debian/copyright' does not exist.
  - gnuefi is not GPLv2+. Only one AArch64 file has GPLv2+ headers,
    all others have BSD-3c
  - efilib is BSD-2c

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gnu-efi/gnu-efi.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 0e067a6..cdbfe8e 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -8,8 +8,8 @@ GNU_EFI_VERSION = 3.0.1
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
-GNU_EFI_LICENSE_FILES = debian/copyright
+GNU_EFI_LICENSE = BSD-3c (gnuefi), BSD-2c (efilib)
+GNU_EFI_LICENSE_FILES = README.efilib
 
 # gnu-efi is a set of library and header files used to build
 # standalone EFI applications such as bootloaders. There is no point
-- 
1.9.1
