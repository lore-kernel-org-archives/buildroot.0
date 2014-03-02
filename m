From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:28:55 +0100
Subject: [Buildroot] [git commit] lvm2: enable cmdlib and dmeventd
Message-ID: <20140302153402.967019BAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35d3713bdc20a3ac22537ca04b0c1c6deab625cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to use a newer dmraid, the lvm2 package needs
to be compiled with --enable-cmdlib --enable-dmeventd, which
dmraid can then invoke on boot.

[Thomas: slightly reformat the list of configure options.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Antony Vennard <arv@vx9.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6566b32..ee281a1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -13,7 +13,11 @@ LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
+LVM2_CONF_OPT += \
+	--enable-write_install \
+	--enable-pkgconfig \
+	--enable-cmdlib \
+	--enable-dmeventd
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
