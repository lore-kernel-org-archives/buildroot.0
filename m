From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 20:56:12 +0200
Subject: [Buildroot] [git commit] xapp_xedit: needs MMU
Message-ID: <20140601200640.E539E9CE46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4ecb34fe45f3410eb46b78e7e38a414b34a65f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6b9/6b941b5992c73acd19e8077dbe6cb9fc65e5eba1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xedit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index 5a70459..feaea74 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_USE_MMU # fork()
 	help
 	  simple text editor for X
