From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:04:02 +0200
Subject: [Buildroot] [git commit] package/postgis: add optional pcre
 dependency
Message-ID: <20210415185143.3FF5983B62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee60021d54a0970b9441334609b6bbde93eb21a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/postgis/postgis.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 5a2987b182..c6c1b8ff50 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -35,4 +35,8 @@ else
 POSTGIS_CONF_OPTS += --without-json
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+POSTGIS_DEPENDENCIES += pcre
+endif
+
 $(eval $(autotools-package))
