From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 15:43:42 +0200
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: also install
 libparson
Message-ID: <20200413133359.8F6FD8EA22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94120fd7c71881e7b3963d5db27802241d9eeed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package builds libparson, but does not install it, let's fix this.

Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
