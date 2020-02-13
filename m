From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Thu, 13 Feb 2020 16:14:13 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/rabbitmq-server: clean up
 license list
In-Reply-To: <20200204100733.22106-3-frank.vanbever@essensium.com>
References: <20200204100733.22106-3-frank.vanbever@essensium.com>
Message-ID: <20200213151414.25831-1-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Moving the licenses to a single file name per line and ensuring they're in
alphabetical order makes it easier to see what changed in case these licenses
change.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 package/rabbitmq-server/rabbitmq-server.hash |  2 +-
 package/rabbitmq-server/rabbitmq-server.mk   | 27 +++++++++++++-------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
index 3c552820c1..5ad55b167b 100644
--- a/package/rabbitmq-server/rabbitmq-server.hash
+++ b/package/rabbitmq-server/rabbitmq-server.hash
@@ -1,6 +1,5 @@
 # Locally computed
 sha256  395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
-sha256  f3a296f863a2729506bf0e9f1b3f219e63ede4906a88790fdd4d696f825b70ba  LICENSE-MPL-RabbitMQ
 sha256  2d6485b111c3ef40900d5accb40388fbf99d4b018274b3617e1c92b86d95c985  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-APACHE2-ExplorerCanvas
 sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE-APL2-Rebar
@@ -15,4 +14,5 @@ sha256  fc93cc7361401413887f4c1349e4b0be4bcef936eaafbcc7485038abe197c692  LICENS
 sha256  363a3b367503176fad7fd794168193ff9add85c3d28b73af804b67ff11c59115  LICENSE-MIT-Mochiweb
 sha256  cfc50fa0d7ee02c2d71c8866ef211a4814e8c89c50b725d27e8bdf550291a9ed  LICENSE-MIT-Sammy060
 sha256  c29e506dd734930964382e52e98f60ab7a46c2be639165a3a25083272c8fc29f  LICENSE-MIT-SockJS
+sha256  f3a296f863a2729506bf0e9f1b3f219e63ede4906a88790fdd4d696f825b70ba  LICENSE-MPL-RabbitMQ
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE-MPL2
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index f9c28e6677..99b1ed4100 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -8,15 +8,24 @@ RABBITMQ_SERVER_VERSION = 3.6.6
 RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
 RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
 RABBITMQ_SERVER_LICENSE = MPL-1.1, Apache-2.0, BSD-2-Clause, EPL, MIT, MPL-2.0
-RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
-				LICENSE LICENSE-APACHE2-ExplorerCanvas \
-				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
-				LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
-				LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
-				LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
-				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
-				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
-				LICENSE-MPL2
+RABBITMQ_SERVER_LICENSE_FILES =
+	LICENSE \
+	LICENSE-APACHE2-ExplorerCanvas \
+	LICENSE-APL2-Rebar \
+	LICENSE-APL2-Stomp-Websocket \
+	LICENSE-BSD-base64js \
+	LICENSE-BSD-glMatrix \
+	LICENSE-EPL-OTP
+	LICENSE-MIT-EJS10 \
+	LICENSE-MIT-Flot \
+	LICENSE-MIT-jQuery164 \
+	LICENSE-MIT-Mochi \
+	LICENSE-MIT-Mochiweb \
+	LICENSE-MIT-Sammy060 \
+	LICENSE-MIT-SockJS \
+	LICENSE-MPL-RabbitMQ \
+	LICENSE-MPL2
+
 RABBITMQ_SERVER_DEPENDENCIES = host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
 
-- 
2.20.1
