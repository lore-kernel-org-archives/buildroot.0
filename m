From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:04:32 +0100
Subject: [Buildroot] [git commit] package/collectd: fix build with amqp
Message-ID: <20201031205218.970D3860C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edb94d770ba8c8688e384021473beb41b986d37c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

collectd unconditionally uses amqp_ssl_socket.h since version 5.11.0 and
https://github.com/collectd/collectd/commit/e4808ad138de362fab5efa09648fbc101f97bd76

Fixes:
 - http://autobuild.buildroot.org/results/525abe0a5cca81ff517c9c07c092d85160c7eb62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
