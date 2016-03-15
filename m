From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:17:18 +0100
Subject: [Buildroot] [git commit] midori: enable optional gcr support
Message-ID: <20160315221837.F2B437FE43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dcd577c662214a8eb6c59fef3709c73aa5c4c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only used/useful with the gtk3 backend though.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/midori/midori.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 197f51a..7927400 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -40,6 +40,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
 MIDORI_DEPENDENCIES += libgtk3
+# Only useful with gtk3
+ifeq ($(BR2_PACKAGE_GCR),y)
+MIDORI_DEPENDENCIES += gcr
+endif
 else
 MIDORI_CONF_OPTS += -DUSE_GTK3=OFF
 MIDORI_DEPENDENCIES += libgtk2
