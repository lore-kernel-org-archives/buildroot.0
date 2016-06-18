From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:36:20 +0200
Subject: [Buildroot] [git commit] sstrip: mark as deprecated
Message-ID: <20160618133629.9EC0381A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80899ff982b5645839e6f00021276c69c531f9df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sstrip is unmaintained and potentially harmful, as Yann explained in
commit 6a6962fd82ca ("build/sstrip: deprecate for 2014.05").

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sstrip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
index 12a5941..c458f8e 100644
--- a/package/sstrip/Config.in
+++ b/package/sstrip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SSTRIP
 	bool "sstrip"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	help
 	  Small utility that removes a few bytes from an executable that
 	  strip leaves behind.
