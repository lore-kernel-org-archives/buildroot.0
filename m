From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 26 Oct 2015 13:02:13 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Link against librt
Message-ID: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the rabbit-mq tools need to link against librt, specify
LIBS=-lrt when configuring.

Fixes:
http://autobuild.buildroot.net/results/a3d/a3dfdebd76d47df11a8e26a215bb88fbce8dc6f7
http://autobuild.buildroot.net/results/7d2/7d26e8efe67bf958162a309acb20800e669543e4
http://autobuild.buildroot.net/results/7b5/7b5370d12a2ff8937cba3a201d4edce3dcd12a6e
http://autobuild.buildroot.net/results/bab/babbb089ce1a7750495323248f21402960fb6c80

Helped-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 1ade7cf..3441751 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -11,6 +11,8 @@ SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
+# rabbit-mq needs -lrt
+SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages
 SYSLOG_NG_PATCH = \
 	https://github.com/dnsjts/syslog-ng/commit/7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch \
-- 
2.5.3
