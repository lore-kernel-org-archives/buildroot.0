From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 08:25:26 +0100
Subject: [Buildroot] [git commit] package/exiv2: annotate CVE-2019-13504
Message-ID: <20200301071621.EE0BF8F001@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4815bbc7b003939258aaa072dd92229c0176bc9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2019-13504 is misclassified (by our CVE tracker) as affecting
version 0.27.2, while in fact both commits that fixed this issue are
already in this version: bd0afe039043 and 54f0bebca032.

(From: https://security-tracker.debian.org/tracker/CVE-2019-13504)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/exiv2/exiv2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index ee96a1c2c8..5ca16c4747 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -10,6 +10,11 @@ EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
 EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
 
+# CVE-2019-13504 is misclassified (by our CVE tracker) as affecting version
+# 0.27.2, while in fact both commits that fixed this issue are already in this
+# version.
+EXIV2_IGNORE_CVES += CVE-2019-13504
+
 # 0001-crwimage-Check-offset-and-size-against-total-size.patch
 EXIV2_IGNORE_CVES += CVE-2019-17402
 
