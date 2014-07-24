From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:31 +0200
Subject: [Buildroot] [PATCH 4 of 7] uclibc: only add kconfig targets if
	uclibc is enabled
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <80c907c0dfca068ee3b1.1406224171@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy of linux.mk, only enable the kconfig targets (menuconfig,
update-config, ...) when the uclibc package is actually enabled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff -r ec98df5449b0 -r 80c907c0dfca package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Tue Jul 22 20:35:36 2014 +0200
+++ b/package/uclibc/uclibc.mk	Wed Jul 23 20:12:32 2014 +0200
@@ -533,6 +533,8 @@
 
 $(eval $(generic-package))
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
+
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 UCLIBC_KCONFIG_OPT = \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -542,5 +544,7 @@
 
 $(eval $(kconfig-package))
 
+endif
+
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
