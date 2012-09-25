From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 11:30:56 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: needs record proto
Message-ID: <20120925093428.20F549970E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b990b09fdac03188dd20a3f699b92a6eb2476b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/0ab69c80b3e5e95a8947c32231d32da895deca60

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 02c2828..7d2f2de 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8018a89..80431b4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -39,6 +39,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_inputproto 		\
 	xproto_kbproto 			\
 	xproto_randrproto 		\
+	xproto_recordproto 		\
 	xproto_renderproto 		\
 	xproto_resourceproto 		\
 	xproto_videoproto 		\
