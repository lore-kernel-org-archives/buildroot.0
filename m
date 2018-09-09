From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:19:51 +0200
Subject: [Buildroot] [git commit] acpid: depends on BR2_USE_MMU
Message-ID: <20180909131906.A7698838B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=448d67e3d5e6085151e9cf61b9a3c90d3a889f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

acpid needs fork

Fixes:
 - http://autobuild.buildroot.org/results/2cb0435d36a2aa2d75b6c1dfecc93bb49b0f6266

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index b74e9d2262..0c8ecf2473 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
