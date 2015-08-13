From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Thu, 13 Aug 2015 12:50:11 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: don't try to use IDN feature
Message-ID: <1439463011-29089-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/msmtp/msmtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index bff2620..7c8261e 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -10,6 +10,7 @@ MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
 MSMTP_CONF_OPTS = \
 	--without-libidn \
+	--disable-gai-idn \
 	--without-libgsasl
 MSMTP_LICENSE = GPLv3+
 MSMTP_LICENSE_FILES = COPYING
-- 
2.4.6
