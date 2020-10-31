From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Oct 2020 17:14:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix build with amqp
Message-ID: <20201031161421.231545-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

collectd unconditionally uses amqp_ssl_socket.h since version 5.11.0 and
https://github.com/collectd/collectd/commit/e4808ad138de362fab5efa09648fbc101f97bd76

Fixes:
 - http://autobuild.buildroot.org/results/525abe0a5cca81ff517c9c07c092d85160c7eb62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 9723b1ae1c..39ecbcfe54 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -582,6 +582,7 @@ comment "Select at least one for collectd to be useful"
 
 config BR2_PACKAGE_COLLECTD_AMQP
 	bool "amqp"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Send/receive values via the Advanced Message Queuing Protocol
-- 
2.28.0
