From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 14:53:50 +0100
Subject: [Buildroot] [git commit] package/lz4: annotate CVE-2014-4715
Message-ID: <20200328134031.E7E57888C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45db4bb08e3e550db483d8745fe8aaede2fa7e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2014-4715 is misclassified (by our CVE tracker) as affecting
version 1.9.2, while in fact this issue has been fixed since lz4-r130:
https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08

See https://github.com/lz4/lz4/issues/818

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lz4/lz4.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 2a658fbba5..1d32666ccc 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -10,6 +10,12 @@ LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
+# CVE-2014-4715 is misclassified (by our CVE tracker) as affecting version
+# 1.9.2, while in fact this issue has been fixed since lz4-r130:
+# https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08
+# See https://github.com/lz4/lz4/issues/818
+LZ4_IGNORE_CVES += CVE-2014-4715
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
 else ifeq ($(BR2_SHARED_LIBS),y)
