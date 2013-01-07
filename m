From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon,  7 Jan 2013 21:43:17 +0100
Subject: [Buildroot] [PATCH v2 4/6] lvm2: Install devmapper.pc to
	staging/target pkgconfig directory.
In-Reply-To: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1357591399-3566-5-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change if some package which have dependency on device mapper and use
pkgconfig to check version always fail to find library because devmapper.pc file wasn't
installed.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/lvm2/lvm2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 52326ea..f54caa4 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -21,7 +21,7 @@ LVM2_BINS = \
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += --enable-write_install
+LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the CC passed at configure time.
-- 
1.7.10.4
