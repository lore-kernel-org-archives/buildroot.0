From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:49:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/xen: bump version
 to 4.14.2
Message-ID: <20210508142103.E98EB81038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c9459e305cb904ae4c124c32c57e78d6c18fed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Includes a number of bugfixes and the security fixes up to 368, so drop
those.

For details, see the release notes:
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-2/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc5d9c98355f8c82192fe2cff1c8c9bfcea5b03d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash |  8 +-------
 package/xen/xen.mk   | 15 +--------------
 2 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 6893414313..fd0310c921 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,9 +1,3 @@
 # Locally computed
-sha256  cf0d7316ad674491f49b7ef0518cb1d906a2e3bfad639deef0ef2343b119ac0c  xen-4.14.1.tar.gz
+sha256  e35099a963070e3c9f425d1e36cbb1c40b7874ef449bfafd6688343783cb25ad  xen-4.14.2.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
-# https://xenbits.xenproject.org/xsa/advisory-360.html
-sha256  809515011efb781a2a8742e9acfd76412d3920c2d4142bb187588cd36f77383e  xsa360-4.14.patch
-# https://xenbits.xenproject.org/xsa/advisory-364.html
-sha256  dc313c70bb07b4096bbc4612cbbc180589923277411dede2fda37f04ecc846d6  xsa364.patch
-# https://xenbits.xenproject.org/xsa/advisory-368.html
-sha256  55bbe59c75b69f493e364dfcf6cdbc7db4acd32dbf0b4d2466815b7c1f1823ce  xsa368-4.14.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 533882e05b..b84214ed16 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,26 +4,13 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.1
+XEN_VERSION = 4.14.2
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa360-4.14.patch \
-	https://xenbits.xenproject.org/xsa/xsa364.patch \
-	https://xenbits.xenproject.org/xsa/xsa368-4.14.patch
-
-# xsa360-4.14.patch
-XEN_IGNORE_CVES += CVE-2021-3308
-
-# xsa364.patch
-XEN_IGNORE_CVES += CVE-2021-26933
-
-# xsa368-4.14.patch
-XEN_IGNORE_CVES += CVE-2021-28687
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
