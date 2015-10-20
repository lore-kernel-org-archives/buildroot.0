From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Oct 2015 21:16:31 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
Message-ID: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If --with-libesmtp is omitted a host tool is invoked to detect the
location of the library and headers, which is obviously the wrong thing
for a cross-compile environment. Explicitly add --with-libesmtp to
resolve this.

Fixes:
http://git.buildroot.net/buildroot/commit/?id=539acb7500588d0a277357cf831c9f25f770578d
http://git.buildroot.net/buildroot/commit/?id=01f41585a78406f6e830d5eaf4413a983812a299

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 7371060..2bbace8 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -37,6 +37,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 SYSLOG_NG_DEPENDENCIES += libesmtp
 SYSLOG_NG_CONF_OPTS += --enable-smtp
+SYSLOG_NG_CONF_OPTS += --with-libesmtp="$(STAGING_DIR)/usr"
 else
 SYSLOG_NG_CONF_OPTS += --disable-smtp
 endif
-- 
2.5.3
