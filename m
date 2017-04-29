From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:56:38 +0200
Subject: [Buildroot] [git commit] package/qt: drop option for license
	approved
Message-ID: <20170429135924.120138047C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b550e8bee29cc2559f973e309f3f8f6827fde49e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in previous commits, Buildroot only ever uses the free
license, and we do not have a click-wrap approval for any such free
license for any other package.

The option to approve the license now has no prompt and is no longer
used anywhere.

Legacy handling is not added because it is not useful: when the option
was enabled, it meant "accept the open source license", which is now the
default and only existing behavior.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
[Thomas: remove legacy handling as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 5f07bd2..d3a01da 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -99,10 +99,6 @@ config BR2_PACKAGE_QT_STATIC
 
 endchoice
 
-config BR2_PACKAGE_QT_LICENSE_APPROVED
-	bool
-	default y
-
 config BR2_PACKAGE_QT_CONFIG_FILE
 	string "Config file"
 	help
