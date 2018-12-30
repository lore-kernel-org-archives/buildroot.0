From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:42:27 +0100
Subject: [Buildroot] [git commit] package/rauc: target rauc needs unsquashfs
 at runtime
Message-ID: <20181230213751.BE74881374@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a4dba21b9f9469b189ad04f74138039a4ba8109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to provide info about a bundle file, e.g. running "rauc info
bundle.raucb", rauc needs to use the unsquashfs progam from the squashfs
package.

This was not documented until upstream commit 10c501c12752 ("docs:
integration: document need for 'unsquashfs' tool for 'rauc info'"), but
is already present in rauc.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
