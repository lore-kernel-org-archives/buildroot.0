From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 15:17:48 +0200
Subject: [Buildroot] [PATCH 3/3] rsyslog: add optional gnutls support
In-Reply-To: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
References: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
Message-ID: <1465996668-6444-3-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adrien Decostre <ad.decostre@gmail.com>

[Peter: drop explicit option and handle like other dependencies]
Signed-off-by: Adrien Decostre <ad.decostre@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 40e3b33..18a5737 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -22,6 +22,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 RSYSLOG_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+RSYSLOG_DEPENDENCIES += gnutls
+RSYSLOG_CONF_OPTS += --enable-gnutls
+else
+RSYSLOG_CONF_OPTS += --disable-gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEE),y)
 RSYSLOG_DEPENDENCIES += libee
 endif
-- 
2.7.0
