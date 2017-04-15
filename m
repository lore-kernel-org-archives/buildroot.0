From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Apr 2017 01:23:31 +0300
Subject: [Buildroot] [PATCH] trinity: fix detection of BPF features
Message-ID: <74ff6eb6db4f789f3f0c0048aa2c01acf09a6f7a.1492295011.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to detect presence of the map_flags field in bpf_attr.

Fixes:
http://autobuild.buildroot.net/results/1d3/1d3dcb908b7bb4559e1103e09907ab043ed44679/
http://autobuild.buildroot.net/results/269/269e1c125094b97dd9dfda0e174d2c9f3b103c3b/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/trinity/trinity.hash | 1 +
 package/trinity/trinity.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index ca74264cb927..4998f5ad02bc 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -2,3 +2,4 @@
 sha256 4cb2bd4049ce523fdf47490c4c18b8eb713c720d4b3b13d6ec2ae246aac908ad  trinity-1.7.tar.xz
 sha256 5601474b10973b99f6f4ecc67c8ac54000754d7110553cc81c7648bd7e73c810  b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch
 sha256 1974e473113b4e79fb2ff820e2b03f475a538e43343c24ca077a04214b9e0418  f447db18b389050ecc5e66dbf549d5953633e23e.patch
+sha256 9f9846a9c257b7df7e944c8b3ea956a8e8166bba67b3ea6c231382f095753312  87427256640f806710dd97fc807a9a896147c617.patch
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index f76345e69831..4d4078d1e2e0 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -11,7 +11,8 @@ TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
 TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc210bc1fc247efb4d177e9f7e3d.patch \
-		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch
+		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch \
+		https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617.patch
 
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
-- 
2.11.0
