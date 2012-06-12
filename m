From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:40 -0500
Subject: [Buildroot] [PATCH 4/7] midori: change use of BR2_JLEVEL to
	PARALLEL_JOBS
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-5-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/midori/midori.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 0b3439c..aa376a2 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -34,7 +34,7 @@ define MIDORI_CONFIGURE_CMDS
 endef
 
 define MIDORI_BUILD_CMDS
-       (cd $(@D); ./waf build -j $(BR2_JLEVEL))
+       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define MIDORI_INSTALL_TARGET_CMDS
-- 
1.7.6.5
