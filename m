From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Tue, 21 Jul 2020 20:05:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: NVD database has been
 updated
Message-ID: <20200721180555.31453-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Thanks to Matthew W. & Thomas, the NVD database has been updated
and CVE-2010-0751 is now declared fixed, see
https://security-tracker.debian.org/tracker/CVE-2010-0751

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libnids/libnids.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index fb3df318b4..4a67215242 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -12,10 +12,6 @@ LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
 
-# CVE-2010-0751 was fixed in libnids v1.24 but the NVD database is not
-# aware of the fix, ignore it until this is updated
-LIBNIDS_IGNORE_CVES += CVE-2010-0751
-
 # disable libnet if not available
 # Tests in configure.in expect --with-libnet=$build_dir
 # not an installation patch like in our context.
-- 
2.20.1
