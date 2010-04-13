From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:03 +0200
Subject: [Buildroot] [PATCH 30/41] webkit: setup icu-config util path
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-31-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/webkit/webkit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 2121f4b..0402f9a 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -24,6 +24,8 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
+WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config
+
 define WEBKIT_AUTOGEN_PATCH
 $(SED) 's%ACLOCAL_FLAGS=.*%ACLOCAL_FLAGS="-I autotools -I $(STAGING_DIR)/usr/share/aclocal"%' $(WEBKIT_DIR)/autogen.sh
 $(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
-- 
1.7.0.4
