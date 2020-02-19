From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 17:01:58 +0100
Subject: [Buildroot] [PATCH 1/5] package/audiofile: annotate _IGNORE_CVES
 for the included security patches
Message-ID: <20200219160203.874-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audiofile/audiofile.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 2f2e8902e9..bb46436d85 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -15,6 +15,22 @@ AUDIOFILE_AUTORECONF = YES
 AUDIOFILE_LICENSE = GPL-2.0+, LGPL-2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
+# 0003-Always-check-the-number-of-coefficients.patch
+AUDIOFILE_IGNORE_CVES += \
+	CVE-2017-6827 CVE-2017-6828 CVE-2017-6832 \
+	CVE-2017-6833 CVE-2017-6835 CVE-2017-6837
+# 0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
+AUDIOFILE_IGNORE_CVES += CVE-2017-6829
+# 0005-Check-for-multiplication-overflow-in-sfconvert.patch
+AUDIOFILE_IGNORE_CVES += \
+	CVE-2017-6830 CVE-2017-6834 CVE-2017-6836 CVE-2017-6838
+# 0006-Actually-fail-when-error-occurs-in-parseFormat.patch
+AUDIOFILE_IGNORE_CVES += CVE-2017-6831
+# 0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
+AUDIOFILE_IGNORE_CVES += CVE-2017-6839
+# 0008-CVE-2015-7747.patch
+AUDIOFILE_IGNORE_CVES += CVE-2015-7747
+
 ifeq ($(BR2_PACKAGE_FLAC),y)
 AUDIOFILE_DEPENDENCIES += flac
 AUDIOFILE_CONF_OPTS += --enable-flac
-- 
2.20.1
