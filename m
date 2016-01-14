From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 14 Jan 2016 09:47:57 +0100
Subject: [Buildroot] [PATCH v2] rabbitmq-c: needs a toolchain with
	posix_spawn support
Message-ID: <1452761277-28917-1-git-send-email-joris.lijssens@gmail.com>
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
index b330c90..73e3909 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# disable rabbitmq-c on blackfin, because it doesn't support
+	# posix_spawn :
+	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
+	depends on !BR2_bfin
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
-- 
1.8.3.1
