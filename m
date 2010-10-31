From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:12 +0100
Subject: [Buildroot] [PATCH 4/8] Makefile: compute the version string for
	all to use
In-Reply-To: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1288542916-21883-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages use the buildroot version string (to set thier own version string).
Computing the version string globally will makes it easy for them to use it
instead of re-computing it in every packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8d53778..d6a7628 100644
--- a/Makefile
+++ b/Makefile
@@ -35,6 +35,10 @@ CONFIG_CONFIG_IN=Config.in
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
+# Compute the full local version string so packages can use it as-is
+# Need to export it, so it can be got from environment in children (eg. mconf)
+export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion)
+
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-- 
1.7.1
