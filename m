From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 19:02:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/libvorbis: annote CVE-2018-10393
In-Reply-To: <20200301180226.186420-1-fontaine.fabrice@gmail.com>
References: <20200301180226.186420-1-fontaine.fabrice@gmail.com>
Message-ID: <20200301180226.186420-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bark_noise_hybridmp in psy.c in Xiph.Org libvorbis 1.3.6 has a
stack-based buffer over-read.

Same patch as for CVE-2017-14160

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvorbis/libvorbis.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index bf479a3900..708f3364ec 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -13,6 +13,9 @@ LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
 
+# 0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
+LIBVORBIS_IGNORE_CVES += CVE-2018-10393
+
 # 0002-Sanity-check-number-of-channels-in-setup.patch
 LIBVORBIS_IGNORE_CVES += CVE-2018-10392
 
-- 
2.25.0
