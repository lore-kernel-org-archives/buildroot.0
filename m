From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:16:16 +0200
Subject: [Buildroot] [git commit] legacy: marked BR2_PACKAGE_GCC_TARGET and
	BR2_HAVE_DEVFILES as removed
Message-ID: <20130902213321.BE8C69B6B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba8f82b0cc25413aa1df93b5f2ba7ddb6bb07b03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These 2 symbols were removed when the gcc has been converted to the
Buildroot package infrastructures.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

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
 
