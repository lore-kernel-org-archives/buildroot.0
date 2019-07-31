From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 21:44:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gupnp-tools: fix
 build with NLS
Message-ID: <20190731212520.0056483A43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfe06e958b2ae2872bed7f6ed1154fdc6c64bbc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f8e16b6d6481ae02c88d0fcaf6fe73efc21bc93a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp-tools/gupnp-tools.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 8f95e04f98..06c7b1fd3b 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -19,7 +19,10 @@ GUPNP_TOOLS_DEPENDENCIES = \
 	gssdp \
 	gupnp \
 	libsoup \
-	libgtk3
+	libgtk3 \
+	$(TARGET_NLS_DEPENDENCIES)
+
+GUPNP_TOOLS_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GUPNP_AV),y)
 GUPNP_TOOLS_CONF_OPTS += --with-av
