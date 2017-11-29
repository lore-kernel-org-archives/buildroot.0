From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:16:22 +0100
Subject: [Buildroot] [git commit] ndisc6: fix bogus <pkg>_DEPENDENCIES names
Message-ID: <20171129220933.D778581D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15d1962cf8b70ebcf52614301f0db242894e28a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Spotted by check-package:

package/ndisc6/ndisc6.mk:14: possible typo: NDISC8_DEPENDENCIES -> *NDISC6*

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ndisc6/ndisc6.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 1b15937..eb4fbbb 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -11,7 +11,7 @@ NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)
 NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPL-2.0 or GPL-3.0
 NDISC6_LICENSE_FILES = COPYING
-NDISC8_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+NDISC6_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 NDISC6_BIN_ += dnssort # perl script
 NDISC6_BIN_$(BR2_PACKAGE_NDISC6_NAME2ADDR) += name2addr addr2name
