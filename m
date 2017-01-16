From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 11:53:47 +0100
Subject: [Buildroot] [git commit] rabbitmq-server: security bump to version
	3.6.6
Message-ID: <20170116124620.6D2C17FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a502f9acfd7ec5592d1e059e0180928b15abd59f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a critical authentication vulnerability in the MQTT plugin
(CVE-2016-9877):

MQTT (MQ Telemetry Transport) connection authentication with a
username/password pair succeeds if an existing username is provided but the
password is omitted from the connection request.  Connections that use TLS
with a client-provided certificate are not affected.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rabbitmq-server/rabbitmq-server.hash | 2 +-
 package/rabbitmq-server/rabbitmq-server.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
index be21477..3cd412d 100644
--- a/package/rabbitmq-server/rabbitmq-server.hash
+++ b/package/rabbitmq-server/rabbitmq-server.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c696134e863f99191a301288c12d69ff00b7e648107ee52c8686ae047dde1bee  rabbitmq-server-3.6.1.tar.xz
+sha256 395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 7e13c2d..d55a8cc 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RABBITMQ_SERVER_VERSION = 3.6.1
+RABBITMQ_SERVER_VERSION = 3.6.6
 RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
 RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
 RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2c, EPL, MIT, MPLv2.0
