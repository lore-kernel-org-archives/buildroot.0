From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Apr 2017 00:25:12 +0200
Subject: [Buildroot] [git commit] mosquitto: enable WITH_ADNS for glibc
	builds
Message-ID: <20170407225240.94A2A7FA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f78b2c13d1a5b4a7903186cf6cc53299791d0da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WITH_ADNS option has been added in version 1.4.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c273c98..9ffd149 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -17,6 +17,13 @@ MOSQUITTO_MAKE_OPTS = \
 	WITH_WRAP=no \
 	WITH_DOCS=no
 
+# adns uses getaddrinfo_a
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_ADNS=no
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
 else
