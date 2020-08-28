From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:06:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/xen: add upstream
 security fix for XSA-327
Message-ID: <20200828170235.1E79784F31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7c58e57ad37c6f884e0d0a1a3978ed3ccd3d711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

CVE-2020-15564: Missing alignment check in VCPUOP_register_vcpu_info

For further details, see the advisory:

https://xenbits.xenproject.org/xsa/advisory-327.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b541b68067f0ef478b2530f4371f2827e9c06e83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 1 +
 package/xen/xen.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index ab5f9d9083..0dd2f571a9 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  b97ce363e55b12c992063f4466c43cba0a6386ceb7a747b4dc670311f337ef01  xen-4.13.1.tar.gz
+sha256  1d057695d5b74ce2857204103e943caeaf773bc4fb9d91ea78016e01a9147ed7  xsa327.patch
 sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 15742b5127..ee5e9847fe 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,6 +6,8 @@
 
 XEN_VERSION = 4.13.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_PATCH = \
+	https://xenbits.xenproject.org/xsa/xsa327.patch
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python3
