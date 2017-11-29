From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:44 +0100
Subject: [Buildroot] [PATCH 7/8] package/asterisk: add comment about a
 check-package false positive
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable is inherited from the target variant, which is
autoreconfed. But the host variant is only the menucselect
sub-directory, which we do not want to autoreconf, so the explcit
NO is required.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/asterisk/asterisk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 50512c0b3a..21dca549a0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -285,6 +285,7 @@ HOST_ASTERISK_LICENSE_FILES = COPYING
 
 # No need to autoreconf for the host variant,
 # so do not inherit the target setup.
+# check-package reports an issue here, but that's a false positive. Ignore.
 HOST_ASTERISK_AUTORECONF = NO
 
 HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/usr/bin/xml2-config
-- 
2.11.0
