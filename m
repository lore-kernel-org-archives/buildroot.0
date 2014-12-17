From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 16 Dec 2014 23:22:15 -0500
Subject: [Buildroot] [PATCH] erlang: fix typo in dependencies
Message-ID: <1418790135-31149-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libatomic_ops was enabled, then the host-erlang dependency was lost.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index dd15539..0b8619e 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -23,7 +23,7 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 ERLANG_CONF_OPTS = --without-javac
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
-ERLANG_DEPENDENCIES = libatomic_ops
+ERLANG_DEPENDENCIES += libatomic_ops
 ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
 endif
 
-- 
1.9.1
