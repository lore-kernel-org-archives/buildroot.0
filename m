From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2013 13:16:53 +0100
Subject: [Buildroot] [git commit] thrift: disable TQTcpServer
Message-ID: <20131210203309.91D909BFBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8635f3d8e57a7605294022bc5ef097b67f0f00a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable TQTcpServer, it doesn't build properly. Fixes:
http://autobuild.buildroot.net/results/ef8/ef8afd0fea786f076a4bbece2fcbefdf5cb32ddd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/thrift.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
