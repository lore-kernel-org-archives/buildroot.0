From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 15:56:21 +0200
Subject: [Buildroot] [git commit] tinycbor: fix detection of cjson
Message-ID: <20161013140508.4123382233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7341abaff3518bee74463d63f0ce52ef253886de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  - http://autobuild.buildroot.net/results/8fc/8fc7365e0dc777edc57e950a84df7fddc13c6776

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycbor/tinycbor.hash | 1 +
 package/tinycbor/tinycbor.mk   | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 8757047..f07fc17 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256	f70de1e6b7e3750abb4ceacf0059e47b47c769f113434de10293b33867ce54c2	tinycbor-v0.3.2.tar.gz
 sha256	7d3aa839ae246e9e14fc73e67869d88c684802c1578fb75503f3fdde1482dcf6	ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
+sha256	42054074478d074d0320e0c64e8d44f60081b6f0d8dc0e3607e0fb7f4dad96a4	ad09b6af11fc8b6391041973783785cfe1559d63.patch	
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 6af2eef..8ce9a76 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -15,6 +15,11 @@ TINYCBOR_LICENSE_FILES = LICENSE
 TINYCBOR_PATCH = \
 	https://github.com/01org/tinycbor/commit/ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
 
+# This patch fixes the issue on cjson detection
+# This patch is currently in dev branch and will be a part of v0.4
+TINYCBOR_PATCH += \
+	https://github.com/01org/tinycbor/commit/ad09b6af11fc8b6391041973783785cfe1559d63.patch
+
 TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
