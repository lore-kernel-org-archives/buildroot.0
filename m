From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 17 Dec 2018 22:15:19 +0000
Subject: [Buildroot] [PATCH] rauc: target rauc needs unsquashfs at runtime
Message-ID: <20181217221500.7317-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to provide info about a bundle file, e.g. running "rauc info
bundle.raucb", rauc needs to use the unsquashfs progam from the squashfs
package.

This was not documented until upstream commit 10c501c12752 ("docs:
integration: document need for 'unsquashfs' tool for 'rauc info'"), but
is already present in rauc.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/rauc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 6433b827d3..456f8f382c 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_RAUC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_DBUS # run-time dependency
+	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
 	  Pengutronix. It supports updating embedded Linux
-- 
2.14.4
