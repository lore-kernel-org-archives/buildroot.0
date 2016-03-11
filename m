From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:00:35 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/jack2: add comment about celt
	and eigen
In-Reply-To: <cover.1457719085.git.yann.morin.1998@free.fr>
References: <cover.1457719085.git.yann.morin.1998@free.fr>
Message-ID: <dc794aba76e931a0c7bb974016708c51b77d3f6b.1457719085.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optinal dependency on celt is not added, because we only have
celt-0.5.1 and jack2 requires celt >= 0.5.2 (even though it does look
for celt >= 0.5.0, it does not build with celt- < 0.5.2). Sinc ewe can
not upgrade celt (for now), we just never make jack2 depend on celt051,
and it won;t find it either, as it just searches for celt.pc and we have
celt051.pc.

As well, the dependency on eigen is only usefull in cunjunction with
gtkiostream, for which we do not have a package. So, we need not depend
on eigen.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jack2/jack2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 6bea373..1f25e74 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -32,6 +32,14 @@ JACK2_DEPENDENCIES += dbus
 JACK2_CONF_OPTS += --dbus
 endif
 
+# Even though it advertises support for celt-0.5.x, jack2 really requires
+# celt >= 0.5.2 but we only have 0.5.1.3 and we can not upgrade, so we do
+# not add a dependency to celt051, which it can't find anyway as it looks
+# for celt.pc but we only have celt-51.pc.
+
+# The dependency against eigen is only usefull in cunjunction with
+# gtkiostream, which we do not have, so we need not depend on eigen.
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
-- 
1.9.1
