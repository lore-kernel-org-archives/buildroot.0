From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 00:28:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: needs host-pkgconf
Message-ID: <20200713222801.2461778-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host-pkgconf dependency, it is only used to find cunit for tests
which are disabled by default but otherwise autoreconf will fail

Fixes:
 - http://autobuild.buildroot.org/results/721c9feb96f93c60505a12f546a64a86b7eb36aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinydtls/tinydtls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
index e683dea1a0..b4fd06ff70 100644
--- a/package/tinydtls/tinydtls.mk
+++ b/package/tinydtls/tinydtls.mk
@@ -9,6 +9,7 @@ TINYDTLS_SITE = $(call github,eclipse,tinydtls,v$(TINYDTLS_VERSION))
 TINYDTLS_LICENSE = EPL-1.0 or EDL-1.0
 TINYDTLS_LICENSE_FILES = LICENSE
 TINYDTLS_INSTALL_STAGING = YES
+TINYDTLS_DEPENDENCIES = host-pkgconf
 # From git
 TINYDTLS_AUTORECONF = YES
 # use inttypes.h data types instead of u_intXX_t for musl compatibility
-- 
2.27.0
