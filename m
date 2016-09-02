From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Sep 2016 22:31:35 +0200
Subject: [Buildroot] [PATCH 9/9] package/enlightenment: set eldbus-codegen
	path
In-Reply-To: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1472848295-13734-9-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the one from the host may be used.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index a86fb86..d77421f 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -19,6 +19,7 @@ ENLIGHTENMENT_DEPENDENCIES = \
 ENLIGHTENMENT_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
 	--disable-pam \
 	--disable-rpath
 
-- 
2.5.5
