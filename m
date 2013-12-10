From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Dec 2013 07:11:06 -0300
Subject: [Buildroot] [PATCH] thrift: disable TQTcpServer
Message-ID: <1386670266-21845-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable TQTcpServer, it doesn't build properly. Fixes:
http://autobuild.buildroot.net/results/ef8/ef8afd0fea786f076a4bbece2fcbefdf5cb32ddd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/thrift/thrift.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 7ee90ac..8af9643 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -27,7 +27,7 @@ endif
 # This is just for the libraries / bindings
 THRIFT_LANG_CONF_OPT += --without-csharp --without-java --without-erlang \
 	--without-python --without-perl --without-php --without-php_extension \
-	--without-ruby --without-haskell --without-go --without-d
+	--without-ruby --without-haskell --without-go --without-d --without-qt4
 HOST_THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT) --without-c_glib
 THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT)
 
-- 
1.8.3.2
