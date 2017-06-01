From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:35:01 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mosquitto: enable
	WITH_ADNS for glibc builds
Message-ID: <20170601144624.3779B8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f7bfc36b3752c1db45925df38a7d7a6e710098e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

WITH_ADNS option has been added in version 1.4.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f78b2c13d1a5b4a7903186cf6cc53299791d0da5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index e79a042..8918128 100644
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
