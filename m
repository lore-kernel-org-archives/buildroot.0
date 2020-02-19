From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 17:01:59 +0100
Subject: [Buildroot] [PATCH 2/5] package/libsndfile: annotate _IGNORE_CVES
 for the included security patches
In-Reply-To: <20200219160203.874-1-peter@korsgaard.com>
References: <20200219160203.874-1-peter@korsgaard.com>
Message-ID: <20200219160203.874-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also mark CVE-2018-13419 as disputed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsndfile/libsndfile.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 22909ffb62..4a375ab609 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -10,6 +10,17 @@ LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 
+# 0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2017-14634
+# 0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
+LIBSNDFILE_IGNORE_CVES += CVE-2018-13139 CVE-2018-19432
+# 0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
+LIBSNDFILE_IGNORE_CVES += \
+	CVE-2017-14245 CVE-2017-14246 CVE-2017-17456 CVE-2017-17457 \
+	CVE-2018-19661 CVE-2018-19662
+# disputed
+LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
+
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
 	--disable-alsa \
-- 
2.20.1
