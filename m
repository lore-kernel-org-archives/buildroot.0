From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 21:53:59 +0200
Subject: [Buildroot] [git commit] rabbitmq-server: add missing host
	dependencies
Message-ID: <20161027195405.75EAD80765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8c8d8d71ec9df826dc5d20d4fea7255f2cb156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0ec785b8fa876d879934af618851d77a3ce70f55
http://autobuild.buildroot.net/results/03eb39eb9498eb42202ac8b16c1ffc175c0b69d3
http://autobuild.buildroot.net/results/199b04408fa8d9c94b9bed42fdcaafb03278f03c

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 4a38955..7e13c2d 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -17,7 +17,7 @@ RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
 				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
 				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
 				LICENSE-MPL2
-RABBITMQ_SERVER_DEPENDENCIES = erlang libxslt
+RABBITMQ_SERVER_DEPENDENCIES = host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
 
 define RABBITMQ_SERVER_BUILD_CMDS
