From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:22 +0100
Subject: [Buildroot] [RFC v3 17/30] erlang: add support for the per-package
	staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-18-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/erlang/erlang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 0c76531..85063b1 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -31,7 +31,7 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 ERLANG_CONF_OPTS = --without-javac
 
 ERLANG_DEPENDENCIES += libatomic_ops
-ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS=-latomic_ops
+ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr LIBS="-latomic_ops -L$(STAGING_DIR)/usr/lib"
 
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
-- 
2.3.1
