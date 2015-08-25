From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:52:18 +0200
Subject: [Buildroot] [git commit] midori: depend on x11 backend for gtk3
Message-ID: <20150825185306.D4CD581E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc56d0fc9b5835baf6d224817e227f689267d709
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mirror commit ba25711e for midori as well, otherwise gtk3 with non-X11
backends can trigger build failures. Fixes:
http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/midori.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index ed2cdd8..197f51a 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -37,7 +37,7 @@ ifeq ($(BR2_PACKAGE_MIDORI_HTTPS),y)
 MIDORI_DEPENDENCIES += glib-networking
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 MIDORI_CONF_OPTS += -DUSE_GTK3=ON -DHALF_BRO_INCOM_WEBKIT2=ON
 MIDORI_DEPENDENCIES += libgtk3
 else
