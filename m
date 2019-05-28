From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:36:59 +0200
Subject: [Buildroot] [git commit] package/suricata: needs autoreconf
Message-ID: <20190528203052.6E96A8916E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0d8743e53b89c2f4657820e3d9384d621f76ffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1ce2db1090c494f57019af4f29691e0f86b48330 was the second patch of
a third patch serie, it was applied without the first one so
AUTORECONF=YES was missing and patch number was wrong. Fix these two
errors.

Fixes:
 - http://autobuild.buildroot.org/results/a26d3493399c43faa37d2d67d772e0833971a9de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...th-pcap.patch => 0001-configure.ac-fix-static-build-with-pcap.patch} | 0
 package/suricata/suricata.mk                                            | 2 ++
 2 files changed, 2 insertions(+)

diff --git a/package/suricata/0002-configure.ac-fix-static-build-with-pcap.patch b/package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch
similarity index 100%
rename from package/suricata/0002-configure.ac-fix-static-build-with-pcap.patch
rename to package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e5884cdfe4..0491fad6d5 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -8,6 +8,8 @@ SURICATA_VERSION = 4.1.3
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
+# We're patching configure.ac
+SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
 	host-pkgconf \
