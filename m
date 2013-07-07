From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:43:44 +0200
Subject: [Buildroot] [PATCH 2/3] crosstool-ng: remove unneed explicit ccache
	dependency
In-Reply-To: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
References: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1373222625-9013-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ccache dependency was here to enforce build order.
It is not needed anymore.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/crosstool-ng/crosstool-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index d3ee5f8..8d98db4 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -11,7 +11,7 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 
 HOST_CROSSTOOL_NG_DEPENDENCIES = \
-	$(if $(BR2_CCACHE),host-ccache) host-gawk \
+	host-gawk \
 	host-automake host-gperf host-bison host-flex \
 	host-texinfo
 
-- 
1.8.3.2
