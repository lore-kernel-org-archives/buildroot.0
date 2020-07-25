From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 09:28:50 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/squid: add
 optional systemd dependency
Message-ID: <20200725072442.0735A87B20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0b1dcaaad23d0bb9eeeee37d6b260fa6bb07267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

systemd is an optional dependency (enabled by default) since version
4.11 and
https://github.com/squid-cache/squid/commit/6fa8c66435d55a2e713db0222cdca3a9dccf5bbe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a70bcb531ce5e22e8a6126a6ed774dd538e18623)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d281eee3ed..ef2f84085c 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -62,6 +62,13 @@ else
 SQUID_CONF_OPTS += --without-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SQUID_CONF_OPTS += --with-systemd
+SQUID_DEPENDENCIES += systemd
+else
+SQUID_CONF_OPTS += --without-systemd
+endif
+
 define SQUID_CLEANUP_TARGET
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
 		RunCache RunAccel)
