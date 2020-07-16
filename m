From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 22:59:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: needs python3
Message-ID: <20200716205939.1965929-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da forgot to propagate
python3 dependency from host-setools to refpolicy

Fixes:
 - http://autobuild.buildroot.org/results/fdeaa54355aa0741eccc7864b034a7b07ef0c4bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/refpolicy/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index b50b2f09ff..e374ab1901 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
+	depends on BR2_PACKAGE_PYTHON3 # host-setools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	# Even though libsepol is not necessary for building, we get
 	# the policy version from libsepol, so we select it, and treat
@@ -58,3 +59,6 @@ endif
 
 comment "refpolicy needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "refpolicy needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
-- 
2.27.0
