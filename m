From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat, 30 Jun 2018 00:25:51 +0200
Subject: [Buildroot] [PATCH 2/3] systemd: add support for PCRE2
In-Reply-To: <20180629222552.12808-1-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
Message-ID: <20180629222552.12808-3-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd can use libpcre2 when available
add detection of that library


Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 16c9d9f290..0d5e348594 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -144,6 +144,13 @@ else
 SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SYSTEMD_DEPENDENCIES += pcre2
+SYSTEMD_CONF_OPTS += -Dpcre2=true
+else
+SYSTEMD_CONF_OPTS += -Dpcre2=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
-- 
2.18.0
