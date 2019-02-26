From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Feb 2019 19:46:48 +0200
Subject: [Buildroot] [PATCH] package/stress-ng: add libbsd optional
 dependency
Message-ID: <f0a91ae28ddcc6f9aa7f8fa3c15d8c9943d17bb2.1551203208.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stress-ng optionally detects and uses BSD wcsl* wchar string functions.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stress-ng/stress-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 187d276b2474..42b27e3cd967 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -12,6 +12,10 @@ STRESS_NG_LICENSE_FILES = COPYING
 
 STRESS_NG_DEPENDENCIES = attr keyutils
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+STRESS_NG_DEPENDENCIES += libbsd
+endif
+
 define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
-- 
2.20.1
