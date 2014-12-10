From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 10 Dec 2014 23:53:55 +0100
Subject: [Buildroot] [PATCH v3 10/12] gcc: enable poison system directories
	option
In-Reply-To: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
References: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1418252037-26636-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit enables the poison system directories option, which is now
available thanks to the gcc patches that have been added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 46ef5c6..958b445 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -50,6 +50,7 @@ HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
 	$(DISABLE_LARGEFILE) \
+	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
-- 
1.9.3
