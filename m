From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jun 2018 21:24:48 +0300
Subject: [Buildroot] [PATCH 2/2] triggerhappy: add optional dependency on
 systemd
In-Reply-To: <d94eeb035e53af51d450c8e49b03e01cce0dfa1a.1528741488.git.baruch@tkos.co.il>
References: <d94eeb035e53af51d450c8e49b03e01cce0dfa1a.1528741488.git.baruch@tkos.co.il>
Message-ID: <2d163bcde561552e4e69fae382b2422ebe92dbf8.1528741488.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

triggerhappy can use systemd for socket activation.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/triggerhappy/triggerhappy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 4c39ab5e5d4e..7c4bf4047650 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -10,6 +10,10 @@ TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TRIGGERHAPPY_DEPENDENCIES += systemd
+endif
+
 define TRIGGERHAPPY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		-C $(@D) thd th-cmd
-- 
2.17.1
