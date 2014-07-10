From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 10 Jul 2014 14:00:26 +0200
Subject: [Buildroot] [PATCH 1/1] bzip2: install shared library for the host
Message-ID: <1404993626-32112-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libbz2.so was explicitly built for the host, but was not installed. Install it.

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/bzip2/bzip2.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index fcddb55..7584694 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -61,6 +61,8 @@ endef
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
 		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+	$(HOST_MAKE_ENV) \
+		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.7.10.4
