From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 06:58:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/azure-iot-sdk-c:
 also install libparson
Message-ID: <20200506051930.E9A738D7AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd389b52fb9ed025192d49bfd5c3c84e97cd318e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The package builds libparson, but does not install it, let's fix this.

Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 94120fd7c71881e7b3963d5db27802241d9eeed2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 35ddb672fb..f63297844d 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -28,7 +28,8 @@ AZURE_IOT_SDK_C_LIBS += \
 	iothub_client/libiothub_client_mqtt_transport.a \
 	iothub_service_client/libiothub_service_client.a \
 	serializer/libserializer.a \
-	umqtt/libumqtt.a
+	umqtt/libumqtt.a \
+	libparson.a
 else
 AZURE_IOT_SDK_C_LIBS += \
 	uamqp/libuamqp.so \
@@ -41,7 +42,8 @@ AZURE_IOT_SDK_C_LIBS += \
 	iothub_client/libiothub_client_mqtt_transport.so \
 	iothub_service_client/libiothub_service_client.so \
 	serializer/libserializer.so \
-	umqtt/libumqtt.so.1.1.11
+	umqtt/libumqtt.so.1.1.11 \
+	libparson.so
 
 define AZURE_IOT_SDK_C_CREATE_SYMLINKS
 	ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so.1
