From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] mosquitto: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.8D06D81110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b92c4de9413eceb0696f0eebead8f661a5534c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosquitto will not build with LibreSSL without patches, so let's
support only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/mosquitto.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c763f48..c9b4418 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -30,8 +30,8 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MOSQUITTO_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+MOSQUITTO_DEPENDENCIES += libopenssl
 MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
