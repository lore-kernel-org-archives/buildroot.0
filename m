From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:19:06 +0200
Subject: [Buildroot] [git commit] package/libnids: ignore CVE-2010-0751
Message-ID: <20200718131509.8D830869AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d6e2e5c987e308827b6254494fd8fdcb6c06bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CVE is falsely reported because it was fixed in package version
1.24 (which we are using). Ignore this CVE until the database is
updated.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnids/libnids.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 4a67215242..fb3df318b4 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -12,6 +12,10 @@ LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
 
+# CVE-2010-0751 was fixed in libnids v1.24 but the NVD database is not
+# aware of the fix, ignore it until this is updated
+LIBNIDS_IGNORE_CVES += CVE-2010-0751
+
 # disable libnet if not available
 # Tests in configure.in expect --with-libnet=$build_dir
 # not an installation patch like in our context.
