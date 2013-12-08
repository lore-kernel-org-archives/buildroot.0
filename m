From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 23:39:37 +0100
Subject: [Buildroot] [git commit] dialog: add missing comment when thread
	support is missing
Message-ID: <20131208224038.206759BF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e12e02a70a7a9634546b477854deba51e1386b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was noticed when reviewing the packaging for the python-dialog
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index b3efd8d..c7cd8a4 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -10,3 +10,7 @@ config BR2_PACKAGE_DIALOG
 	  This application provides a method of displaying several different
 	  types of dialog boxes from shell scripts.  This allows a developer
 	  of a script to interact with the user in a much friendlier manner.
+
+comment "dialog needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
