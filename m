From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 20:48:15 +0100
Subject: [Buildroot] [git commit] rabbitmq-c: needs a toolchain with
	posix_spawn support
Message-ID: <20160114195206.4F533827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40c55be207376f08e23f1a2002ab62d9c2c1afd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
