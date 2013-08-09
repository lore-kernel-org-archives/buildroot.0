From: Hans Bulfone <hans@nil.at>
Date: Fri, 9 Aug 2013 03:37:24 +0200
Subject: [Buildroot] [PATCH 1/1] erlang: install to staging
Message-ID: <mailman.2.1376013708.3404.buildroot@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is required to build custom port drivers/NIFs or code that
uses erl_interface.

Signed-off-by: Hans Bulfone <hans@nil.at>
---
 package/erlang/erlang.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 9f47b84..89104c9 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -12,6 +12,7 @@ HOST_ERLANG_DEPENDENCIES =
 
 ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
+ERLANG_INSTALL_STAGING = YES
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
1.7.10.4
