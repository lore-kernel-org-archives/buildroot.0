From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 19:23:20 +0100
Subject: [Buildroot] [git commit] rabbitmq-c: needs a toolchain with thread
	support
Message-ID: <20160108182923.5D427818A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b248d93b5035d2b161cef7f37d0ad9b8d2eda9e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/312/312f0e59e3f83868e86725ee552b320d0e739f9f/

[Peter: add autobuilder reference]
Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rabbitmq-c/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index f3379f2..b330c90 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
 
 	  https://github.com/alanxz/rabbitmq-c
+
+comment "rabbitmq-c needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
