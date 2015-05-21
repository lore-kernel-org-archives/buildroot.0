From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 09:40:56 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/dovecot: Add optional support
	for icu
In-Reply-To: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432194056-10250-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optional dependency added to fts plugin since Dovecot 2.2.17:
http://hg.dovecot.org/dovecot-2.2/diff/b179bbd226e5/configure.ac

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3b4f6d1..58666d0 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -40,6 +40,13 @@ else
 DOVECOT_CONF_OPTS += --without-bzlib
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+DOVECOT_CONF_OPTS += --with-icu
+DOVECOT_DEPENDENCIES += icu
+else
+DOVECOT_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 DOVECOT_CONF_OPTS += --with-libcap
 DOVECOT_DEPENDENCIES += libcap
-- 
1.7.10.4
