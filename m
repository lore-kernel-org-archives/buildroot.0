From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Dec 2020 10:35:29 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/xen: security
 bump to version 4.13.2
Message-ID: <20201208094337.7C911825CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9f31ae2618d2c9cf2a350de64f8a6e18082ad6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Includes XSA-327..XSA-347 security fixes.  For details, see the
announcement:

https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-2/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 3 +--
 package/xen/xen.mk   | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 0dd2f571a9..42a24f1375 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,4 +1,3 @@
 # Locally computed
-sha256  b97ce363e55b12c992063f4466c43cba0a6386ceb7a747b4dc670311f337ef01  xen-4.13.1.tar.gz
-sha256  1d057695d5b74ce2857204103e943caeaf773bc4fb9d91ea78016e01a9147ed7  xsa327.patch
+sha256  1a1f5517813a91eca38108791501909f7351503ca5eccaf137b7358f95a1e5be  xen-4.13.2.tar.gz
 sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 337aa21ca4..5194aa3bcd 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.13.1
+XEN_VERSION = 4.13.2
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa327.patch
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python3
