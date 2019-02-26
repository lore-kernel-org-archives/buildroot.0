From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 19:40:38 +0100
Subject: [Buildroot] [git commit] package/stress-ng: add libbsd optional
 dependency
Message-ID: <20190226185056.216948E23D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=759c9623aa88d7721529ac9f83b892183fb26edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stress-ng optionally detects and uses BSD wcsl* wchar string functions.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 187d276b24..42b27e3cd9 100644
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
