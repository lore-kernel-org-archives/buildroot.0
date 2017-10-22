From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 15:10:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] xen: add upstream
	post-4.7.3 security fix for XSA-245
Message-ID: <20171022130250.AFAE27FF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=475000af0ec9d4110089edd050d77424dd964b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes XA-245: ARM: Some memory not scrubbed at boot

https://xenbits.xenproject.org/xsa/advisory-245.html

Notice: Not applying XSA-237..244 as they are x86 only and have patch file
name conflicts between 2017.02.x and master.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 ++
 package/xen/xen.mk   | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c1aac76..8a9f65a 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -9,3 +9,5 @@ sha256 5068a78293daa58557c30c95141b775becfb650de6a5eda0d82a4a321ced551c xsa232.p
 sha256 f721cc49ba692b2f36299b631451f51d7340b8b4732f74c98f01cb7a80d8662b xsa233.patch
 sha256 169e4e0eaa6b27e58ff0f4ce50e8fcc3f81b1e0a10210decf22d1b4cac7501fb xsa234-4.8.patch
 sha256 f30848eee71e66687b421b87be1d8e3f454c0eb395422546c62a689153d1e31c xsa235-4.7.patch
+sha256 526f9e1b127fbb316762ce8e8f4563bc9de0c55a1db581456a3017d570d35bdd 0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch
+sha256 7164010112fcccd9cd88e72ace2eeabdb364dd6f4d05c434686267d18067f420 0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index fe68960..2a87d8f 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -15,7 +15,9 @@ XEN_PATCH = \
 	https://xenbits.xenproject.org/xsa/xsa232.patch \
 	https://xenbits.xenproject.org/xsa/xsa233.patch \
 	https://xenbits.xenproject.org/xsa/xsa234-4.8.patch \
-	https://xenbits.xenproject.org/xsa/xsa235-4.7.patch
+	https://xenbits.xenproject.org/xsa/xsa235-4.7.patch \
+	https://xenbits.xenproject.org/xsa/xsa245/0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch \
+	https://xenbits.xenproject.org/xsa/xsa245/0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-python
