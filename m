From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 14 Jan 2016 11:51:33 +0100
Subject: [Buildroot] [PATCH v3] rabbitmq-c: needs a toolchain with
	posix_spawn support
Message-ID: <1452768693-1078-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/rabbitmq-c/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index b330c90..0d08233 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# too old uClibc, not providing posix_spawn functions
+	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
@@ -9,3 +12,4 @@ config BR2_PACKAGE_RABBITMQ_C
 
 comment "rabbitmq-c needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
-- 
1.8.3.1
