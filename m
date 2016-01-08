From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri,  8 Jan 2016 09:37:09 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: needs a toolchain with thread
	support
Message-ID: <1452242229-26069-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
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
-- 
1.8.3.1
