From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Apr 2017 07:20:02 +0300
Subject: [Buildroot] [PATCH] trinity: fix build BPF support is missing
Message-ID: <b37e7003cdb38da7844cb15345290c4d3a190d4b.1492143602.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use upstream patch.

Fixes:
http://autobuild.buildroot.net/results/2ae/2ae76fb61d017d99653d57807cb62c4d8c91ff4d/
http://autobuild.buildroot.net/results/a53/a5391fc272f99b80974582ea735d764db8dc8e9e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/trinity/trinity.hash | 1 +
 package/trinity/trinity.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index 8d88301497e6..ca74264cb927 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity-1.7.tar.xz
 sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
+sha256 1974e473113b4e79fb2ff820e2b03f475a538e43343c24ca077a04214b9e0418  f447db18b389050ecc5e66dbf549d5953633e23e.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 3880aec677ba..f76345e69831 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -10,7 +10,8 @@ TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
-TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
+TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch \
+		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch
 
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
-- 
2.11.0
