From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 09:13:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnids: drop
 LIBNIDS_IGNORE_CVES
Message-ID: <20210608064257.983128A437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c659b358ae1efc16579ab1cd2e6b7cb47d4d2d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

NVD database has been updated:
https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:libnids_project:libnids:1.24:*:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 65c9ebcd90b3686e488c1d638ce5e664d0c18fae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
