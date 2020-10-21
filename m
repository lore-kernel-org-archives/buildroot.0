From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 21 Oct 2020 20:44:24 +1300
Subject: [Buildroot] [PATCH] package/syslog-ng: Ignore CVE-2008-5110
Message-ID: <20201021074424.13589-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This as fixed in syslog-ng 2.0.10 but the NVD database hasn't been
updated.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 7c2368efba..8587da746a 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -17,6 +17,10 @@ SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
 
+# CVE-2008-5110 was fixed in syslog-ng 2.0.10 but the NVD database is not
+# aware of the fix, ignore it
+SYSLOG_NG_IGNORE_CVES += CVE-2008-5110
+
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 SYSLOG_NG_DEPENDENCIES += geoip
 SYSLOG_NG_CONF_OPTS += --enable-geoip
-- 
2.28.0
