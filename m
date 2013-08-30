From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Aug 2013 06:08:59 +0200
Subject: [Buildroot] [PATCH] legacy: marked BR2_PACKAGE_GCC_TARGET and
	BR2_HAVE_DEVFILES as removed
Message-ID: <1377835739-2249-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These 2 symbols were removed when the gcc has been converted to the
Buildroot package infrastructures.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 763f16c..30a44c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -96,6 +96,23 @@ config BR2_VFP_FLOAT
 	  been replaced with a choice of options that allows to select
 	  between various VFP versions/capabilities.
 
+config BR2_PACKAGE_GCC_TARGET
+	bool "gcc on the target filesystem has been removed"
+	select BR2_LEGACY
+	help
+	  The support for gcc in the target filesystem was deprecated
+	  since a while, and has been removed completely from Buildroot.
+	  See Buildroot's documentation for more explanations.
+
+config BR2_HAVE_DEVFILES
+	bool "development files in target filesystem has been removed"
+	select BR2_LEGACY
+	help
+	  The installation of the development files in the target
+	  filesystem was deprecated since a while, and has been removed
+	  completely from Buildroot.
+	  See Buildroot's documentation for more explanations.
+
 ###############################################################################
 comment "Legacy options removed in 2013.05"
 
-- 
1.8.4
