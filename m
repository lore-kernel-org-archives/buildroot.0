From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Feb 2015 23:20:34 +0100
Subject: [Buildroot] [git commit] pkg-rebar: HOST_CC -> HOSTCC
Message-ID: <20150218222259.43FEB7FEAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a02045ca26334a052e26ac07abbbde4563b556ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix HOSTCC typo that would cause host-rebar builds to fail.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-rebar.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 620316d..57fb2f4 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -209,7 +209,7 @@ $(2)_CONF_ENV += $$(REBAR_HOST_DEPS_ENV)
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$(@D); \
-		CC="$$(HOST_CC)" \
+		CC="$$(HOSTCC)" \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
 		$$(REBAR_HOST_DEPS_ENV) \
