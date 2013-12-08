From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:30 +0100
Subject: [Buildroot] [PATCH 01/38] dialog: add missing comment when thread
	support is missing
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was noticed when reviewing the packaging for the python-dialog
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dialog/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.8.1.2
