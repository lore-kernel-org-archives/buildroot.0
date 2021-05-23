From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 15:29:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnids: drop LIBNIDS_IGNORE_CVES
In-Reply-To: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
References: <20210523132938.1520248-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523132938.1520248-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NVD database has been updated:
https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:libnids_project:libnids:1.24:*:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnids/libnids.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 4a9138b80e..3e36838c40 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -13,10 +13,6 @@ LIBNIDS_INSTALL_STAGING = YES
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
2.30.2
