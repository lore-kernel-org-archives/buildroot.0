From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 10:36:03 +0200
Subject: [Buildroot] [git commit] shellinabox: needs MMU support
Message-ID: <20160707083632.6053C80288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2be0b2566a1a56c2a6c420f8dae8d40ec44b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/609ec63d36e235581fe0388c0e1102362743d5b2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shellinabox/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
index b349ef3..10c492c 100644
--- a/package/shellinabox/Config.in
+++ b/package/shellinabox/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SHELLINABOX
 	bool "shellinabox"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
