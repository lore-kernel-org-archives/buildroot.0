From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 19:13:45 +0100
Subject: [Buildroot] [git commit] package/libvorbis: annote CVE-2018-10393
Message-ID: <20200301180210.6798B8F0D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e21730db5c2d4ac305f3d944cad359623a31d638
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bark_noise_hybridmp in psy.c in Xiph.Org libvorbis 1.3.6 has a
stack-based buffer over-read.

Same patch as for CVE-2017-14160

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - update 0001-*.patch to also reference CVE-2018-10393
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch | 3 +++
 package/libvorbis/libvorbis.mk                                         | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch b/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
index e84f3d4799..94dc4c614b 100644
--- a/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
+++ b/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
@@ -4,11 +4,14 @@ Subject: CVE-2017-14160: fix bounds check on very low sample rates.
 X-Git-Url: https://git.xiph.org/?p=vorbis.git;a=commitdiff_plain;h=018ca26dece618457dd13585cad52941193c4a25
 
 CVE-2017-14160: fix bounds check on very low sample rates.
+CVE-2018-10393: Out-of-bounds Read
 
 Downloaded from upstream commit
 https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=018ca26dece618457dd13585cad52941193c4a25
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[yann.morin.1998 at free.fr: also fixes CVE-2018-10393]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
 
 diff --git a/lib/psy.c b/lib/psy.c
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
 
