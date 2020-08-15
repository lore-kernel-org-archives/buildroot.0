From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Aug 2020 10:20:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: fix build with gcc 10
Message-ID: <20200815082034.2056096-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e444f46cd6e6d767592b17b83095737d0508a475

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-setup_options-definitions-as-extern.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch

diff --git a/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch b/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
new file mode 100644
index 0000000000..3a7e32950e
--- /dev/null
+++ b/package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
@@ -0,0 +1,31 @@
+From a513dea1cf000164fd87e56525d098a426131a86 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 12:59:38 -0700
+Subject: [PATCH] v84: Make setup_options definitions as extern
+
+This is already defined in drbdadm_main.c, therefore make this
+declaration to be extern for other modules
+
+Fixes compatibility with gcc-10 which uses -fno-common by default
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved from:
+https://github.com/LINBIT/drbd-utils/commit/a513dea1cf000164fd87e56525d098a426131a86]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ user/v84/drbdadm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/user/v84/drbdadm.h b/user/v84/drbdadm.h
+index ed63d78c..8469f1c4 100644
+--- a/user/v84/drbdadm.h
++++ b/user/v84/drbdadm.h
+@@ -251,7 +251,7 @@ struct setup_option {
+ 	bool explicit;
+ 	char *option;
+ };
+-struct setup_option *setup_options;
++extern struct setup_option *setup_options;
+ 
+ extern void add_setup_option(bool explicit, char *option);
+ 
-- 
2.27.0
