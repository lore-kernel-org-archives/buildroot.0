From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 15:09:12 +0200
Subject: [Buildroot] [git commit] xen: add upstream post-4.9.0 security fix
	for XSA-245
Message-ID: <20171022130210.D4E7D81148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90b9b457ecd5e6ebea9d48f36c030b95ca67059b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes XA-245: ARM: Some memory not scrubbed at boot

https://xenbits.xenproject.org/xsa/advisory-245.html

Notice: Not applying XSA-237..244 as they are x86 only and have patch file
name conflicts between 2017.02.x and master.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 ++
 package/xen/xen.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 3c5981a..4a44d7a 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -9,3 +9,5 @@ sha256 5068a78293daa58557c30c95141b775becfb650de6a5eda0d82a4a321ced551c xsa232.p
 sha256 f721cc49ba692b2f36299b631451f51d7340b8b4732f74c98f01cb7a80d8662b xsa233.patch
 sha256 213f9d81a4ab785db67b9f579c9e88c9c8586c46b93f466a309060750df2df32 xsa234-4.9.patch
 sha256 d8f012734fbf6019c1ff864744e308c41dfb9c7804ca3be2771c2c972cdf4bd5 xsa235-4.9.patch
+sha256 526f9e1b127fbb316762ce8e8f4563bc9de0c55a1db581456a3017d570d35bdd 0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch
+sha256 7164010112fcccd9cd88e72ace2eeabdb364dd6f4d05c434686267d18067f420 0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 5bb18e6..e07389e 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -15,7 +15,10 @@ XEN_PATCH = \
 	https://xenbits.xenproject.org/xsa/xsa232.patch \
 	https://xenbits.xenproject.org/xsa/xsa233.patch \
 	https://xenbits.xenproject.org/xsa/xsa234-4.9.patch \
-	https://xenbits.xenproject.org/xsa/xsa235-4.9.patch
+	https://xenbits.xenproject.org/xsa/xsa235-4.9.patch \
+	https://xenbits.xenproject.org/xsa/xsa245/0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch \
+	https://xenbits.xenproject.org/xsa/xsa245/0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
+
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python
