From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Apr 2017 21:37:30 +0200
Subject: [Buildroot] [PATCH 2/2] mosquitto: enable WITH_ADNS for glibc builds
In-Reply-To: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1491334650-15708-2-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WITH_ADNS option has been added in version 1.4.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.5.0
