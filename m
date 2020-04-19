From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Apr 2020 17:38:23 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: disable on
 unsupported architectures
Message-ID: <20200419233823.29410-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/416/4161bfcd9577cdc6b9795fc3d6903f3bcc124f99/build-end.log
http://autobuild.buildroot.net/results/be7/be709462bbab54e4f405302d54d157218f867939/build-end.log
http://autobuild.buildroot.net/results/b0c/b0ca52e3948cbbc5bb8c6ce08932e355653b08d7/build-end.log
http://autobuild.buildroot.net/results/cd7/cd748aa26fdabcef72a581e1fe26edac14d07d2d/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-greenlet/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index ef82375b0b..eae76ef6be 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
+	depends on !BR2_arceb
+	depends on !BR2_arcle
+	depends on !BR2_microblazebe
+	depends on !BR2_microblazeel
+	depends on !BR2_or1k
+	depends on !BR2_sh
 	help
 	  Lightweight in-process concurrent programming.
 
-- 
2.20.1
