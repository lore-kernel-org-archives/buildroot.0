From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Feb 2014 11:06:03 +0100
Subject: [Buildroot] [PATCH 1/3] lvm2: Enable cmdlib and dmeventd
Message-ID: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to use a newer dmraid, the lvm2 package needs
to be compiled with --enable-cmdlib --enable-dmeventd, which
dmraid can then invoke on boot.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Antony Vennard <arv@vx9.co.uk>
---
 package/lvm2/lvm2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6566b32..0183e05 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -13,7 +13,8 @@ LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
+LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig \
+				 --enable-cmdlib --enable-dmeventd
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
-- 
1.8.5.3
