From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2020 17:02:01 +0100
Subject: [Buildroot] [PATCH 4/5] package/vorbis-tools: annotate _IGNORE_CVES
 for the included security patches
In-Reply-To: <20200219160203.874-1-peter@korsgaard.com>
References: <20200219160203.874-1-peter@korsgaard.com>
Message-ID: <20200219160203.874-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vorbis-tools/vorbis-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index 1bec1e2b96..407ea975e7 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -10,6 +10,14 @@ VORBIS_TOOLS_LICENSE = GPL-2.0
 VORBIS_TOOLS_LICENSE_FILES = COPYING
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
 VORBIS_TOOLS_CONF_OPTS = --program-transform-name=''
+
+# 0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
+VORBIS_TOOLS_IGNORE_CVES += CVE-2015-6749
+# 0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
+VORBIS_TOOLS_IGNORE_CVES += CVE-2014-9638 CVE-2014-9639
+# 0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch
+VORBIS_TOOLS_IGNORE_CVES += CVE-2014-9640
+
 # ogg123 calls math functions but forgets to link with libm
 VORBIS_TOOLS_CONF_ENV = LIBS=-lm
 
-- 
2.20.1
