From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 15 Mar 2018 15:50:51 -0400
Subject: [Buildroot] [PATCH v2 1/4] package: add libnpsr host package
In-Reply-To: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
References: <20180315195054.15991-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180315195054.15991-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Changes since v1:
 * detect 64bits buid machine by filtering on 64 on HOSTARCH
 * remove useless Config.in.host

 package/libnspr/libnspr.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 0c782ae309..a0ff44c900 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -49,4 +49,7 @@ LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIBRARY= install
 LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
 endif
 
+HOST_LIBNSPR_CONF_OPTS += --$(if $(filter %64,$(HOSTARCH)),en,dis)able-64bit
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.16.1
