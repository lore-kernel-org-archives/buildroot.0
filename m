From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:27:59 +0200
Subject: [Buildroot] [git commit] package/net-tools: use
	TARGET_CONFIGURE_OPTS to provide AR, CC and LDFLAGS
Message-ID: <20160608212803.1A83681E8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d2cb12d5f544a5fd24b14326e85901dfeaf3d31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Peter [1], use TARGET_CONFIGURE_OPTS to provide AR, CC and LDFLAGS.

Also remove TARGET_MAKE_ENV since it only contains PATH=$(BR_PATH) which is
also provided by TARGET_CONFIGURE_OPTS.

[1] http://lists.busybox.net/pipermail/buildroot/2016-May/162418.html

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/net-tools/net-tools.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 08d55bb..f0c61d5 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -34,8 +34,7 @@ endef
 NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_CONFIGURE_OPTS) \
 		LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)" \
 		$(MAKE) -C $(@D)
 endef
