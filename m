From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 08:53:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] flashrom: fix static
	build with uClibc
Message-ID: <20170922074750.78B348100D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6c24f879f073ec43c969c8fe62b95a73d0fc031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Define HAVE_STRNLEN to avoid local strnlen() definition.

Fixes:
http://autobuild.buildroot.net/results/7dc/7dc4298e3a07c73e03f70205516d68a0f4c2d297/
http://autobuild.buildroot.net/results/e36/e362848eb45f6b8100131361e6e5faa546f0bbd8/
http://autobuild.buildroot.net/results/69e/69ef10ec710f418b4d10c1edb4f2ce2e49b522bf/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57f4efed7965e573a444544363d0cf74cec13be1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/flashrom.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 7ebda33..c155d40 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -12,7 +12,8 @@ FLASHROM_LICENSE = GPLv2+
 FLASHROM_LICENSE_FILES = COPYING
 
 define FLASHROM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" -C $(@D)
 endef
 
 define FLASHROM_INSTALL_TARGET_CMDS
