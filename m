From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 21:45:10 +0100
Subject: [Buildroot] [git commit] package/jack2: add comment about celt and
	eigen
Message-ID: <20160320204546.8E10F802C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7fc60abc2cbc4ccad2b85d8b11999947a81d1df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optinal dependency on celt is not added, because we only have
celt-0.5.1 and jack2 requires celt >= 0.5.2 (even though it does look
for celt >= 0.5.0, it does not build with celt- < 0.5.2). Since we
cannot upgrade celt (for now), we just never make jack2 depend on
celt051, and it won't find it either, as it just searches for celt.pc
and we have celt051.pc.

As well, the dependency on eigen is only useful in conjunction with
gtkiostream, for which we do not have a package. So, we don't need to
depend on eigen.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/jack2.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 6bea373..777a321 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -32,6 +32,15 @@ JACK2_DEPENDENCIES += dbus
 JACK2_CONF_OPTS += --dbus
 endif
 
+# Even though it advertises support for celt-0.5.x, jack2 really
+# requires celt >= 0.5.2 but we only have 0.5.1.3 and we cannot
+# upgrade, so we do not add a dependency to celt051, which it can't
+# find anyway as it looks for celt.pc but we only have celt-51.pc.
+
+# The dependency against eigen is only useful in conjunction with
+# gtkiostream, which we do not have, so we don't need to depend on
+# eigen.
+
 define JACK2_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS)	\
