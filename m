From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Feb 2016 14:17:26 -0500
Subject: [Buildroot] [PATCH v3 2/2] erlang: remove extraneous
	LIBS=-latomic_ops
In-Reply-To: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
References: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1456082246-28181-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas Petazzoni, this isn't needed when building with
libatomic_ops.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v2->v3:
  - Pulled LIBS=-libatomic_ops removal into a separate patch

 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 8257ab4..b1c8e35 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -34,7 +34,7 @@ ERLANG_CONF_OPTS = --without-javac
 # available. Override this if the user wants libatomic_ops.
 ifeq ($(BR2_PACKAGE_ERLANG_LIBATOMIC_OPS),y)
 ERLANG_DEPENDENCIES += libatomic_ops
-ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
+ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
 endif
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
-- 
2.5.0
