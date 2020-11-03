From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 09:13:13 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/collectd: fix
 build with amqp
Message-ID: <20201103080121.79D358367B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7768fb45bf084fce3e94c8abf13d6cdf2ee53fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

collectd unconditionally uses amqp_ssl_socket.h since version 5.11.0 and
https://github.com/collectd/collectd/commit/e4808ad138de362fab5efa09648fbc101f97bd76

Fixes:
 - http://autobuild.buildroot.org/results/525abe0a5cca81ff517c9c07c092d85160c7eb62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit edb94d770ba8c8688e384021473beb41b986d37c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ddf64015bd..5e526d9e0f 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -571,6 +571,7 @@ comment "Select at least one for collectd to be useful"
 
 config BR2_PACKAGE_COLLECTD_AMQP
 	bool "amqp"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Send/receive values via the Advanced Message Queuing Protocol
