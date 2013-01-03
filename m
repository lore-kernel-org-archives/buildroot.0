From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:02 +0200
Subject: [Buildroot] [PATCH] imlib2: fix imlib2-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-3-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/imlib2/imlib2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index fa0f578..5fad070 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -57,6 +57,8 @@ endif
 
 # drop -L<dir> from linker flags
 define IMLIB2_FIXUP_IMLIB2_CONFIG
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/imlib2-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/imlib2-config
 	$(SED) 's/-L[^ ]*//g' \
 		$(STAGING_DIR)/usr/bin/imlib2-config
 endef
-- 
1.7.7.6
