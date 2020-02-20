From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 13:15:22 +0100
Subject: [Buildroot] [git commit] package/libsndfile: annotate _IGNORE_CVES
 for the included security patches
Message-ID: <20200220120646.86B4C8E5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91126d8863927745123769ed36b3f74c79d93b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also mark CVE-2018-13419 as disputed.

[Peter: add dispute link as suggested by Thomas]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsndfile/libsndfile.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 22909ffb62..19c3184961 100644
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
+# disputed, https://github.com/erikd/libsndfile/issues/398
+LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
+
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
 	--disable-alsa \
