From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Sep 2017 17:49:08 +0200
Subject: [Buildroot] [PATCH-2017.02.x] xen: add upstream post-4.7.3 security
	fixes
Message-ID: <20170918154908.2935-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

XSA-226: multiple problems with transitive grants (CVE-2017-12135)
XSA-227: x86: PV privilege escalation via map_grant_ref (CVE-2017-12137)
XSA-228: grant_table: Race conditions with maptrack free list handling
         (CVE-2017-12136)
XSA-230: grant_table: possibly premature clearing of GTF_writing /
	 GTF_reading (CVE-2017-12855)
XSA-231: Missing NUMA node parameter verification (CVE-2017-14316)
XSA-232: Missing check for grant table (CVE-2017-14318)
XSA-233: cxenstored: Race in domain cleanup (CVE-2017-14317)
XSA-234: insufficient grant unmapping checks for x86 PV guests
         (CVE-2017-14319)
XSA-235: add-to-physmap error paths fail to release lock on ARM

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash |  9 +++++++++
 package/xen/xen.mk   | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 0b14e2966c..c1aac7624b 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,11 @@
 # Locally computed
 sha256 5b5385b476e59e4cf31ecc6dd605df38814b83432b8e8d917f18c8edfdfb708f xen-4.7.3.tar.gz
+sha256 fffcc0a4428723e6aea391ff4f1d27326b5a3763d2308cbde64e6a786502c702 xsa226-4.7.patch
+sha256 9923a47e5f86949800887596f098954a08ef73a01d74b1dbe16cab2e6b1fabb2 xsa227.patch
+sha256 5a7416f15ac9cd7cace354b6102ff58199fe0581f65a36a36869650c71784e48 xsa228-4.8.patch
+sha256 77a73f1c32d083e315ef0b1bbb119cb8840ceb5ada790cad76cbfb9116f725cc xsa230.patch
+sha256 ce29b56a0480f4835b37835b351e704d204bb0ccd22325f487127aa2776cc2cf xsa231-4.7.patch
+sha256 5068a78293daa58557c30c95141b775becfb650de6a5eda0d82a4a321ced551c xsa232.patch
+sha256 f721cc49ba692b2f36299b631451f51d7340b8b4732f74c98f01cb7a80d8662b xsa233.patch
+sha256 169e4e0eaa6b27e58ff0f4ce50e8fcc3f81b1e0a10210decf22d1b4cac7501fb xsa234-4.8.patch
+sha256 f30848eee71e66687b421b87be1d8e3f454c0eb395422546c62a689153d1e31c xsa235-4.7.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index a973b408da..fe68960cb0 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,6 +6,16 @@
 
 XEN_VERSION = 4.7.3
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_PATCH = \
+	https://xenbits.xenproject.org/xsa/xsa226-4.7.patch \
+	https://xenbits.xenproject.org/xsa/xsa227.patch \
+	https://xenbits.xenproject.org/xsa/xsa228-4.8.patch \
+	https://xenbits.xenproject.org/xsa/xsa230.patch \
+	https://xenbits.xenproject.org/xsa/xsa231-4.7.patch \
+	https://xenbits.xenproject.org/xsa/xsa232.patch \
+	https://xenbits.xenproject.org/xsa/xsa233.patch \
+	https://xenbits.xenproject.org/xsa/xsa234-4.8.patch \
+	https://xenbits.xenproject.org/xsa/xsa235-4.7.patch
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-python
-- 
2.11.0
