From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 06:57:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/azure-iot-sdk-c:
 format the libraries list with one lib per line
Message-ID: <20200506051930.9E9318D7AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a768ad62edf8d49bb523c5e4d7e6e5531246527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This makes it easier to review patches modifying these lists of
libraries, such as:

  http://patchwork.ozlabs.org/project/buildroot/patch/20190923115206.4468-1-stephan.hoffmann at ext.grandcentrix.net/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c71030f0fab49be4061fb999a8eabe4190f1f18d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 8b3f670399..b194bf9a4c 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -17,21 +17,31 @@ AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
 # The project only supports building one kind of library.
 # Further the install target installs the wrong files, so we do it here:
 ifeq ($(BR2_STATIC_LIBS),y)
-AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
-	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
+AZURE_IOT_SDK_C_LIBS += \
+	uamqp/libuamqp.a \
+	c-utility/libaziotsharedutil.a \
+	iothub_client/libiothub_client.a \
+	iothub_client/libiothub_client_mqtt_ws_transport.a \
 	iothub_client/libiothub_client_amqp_ws_transport.a \
 	iothub_client/libiothub_client_http_transport.a \
 	iothub_client/libiothub_client_amqp_transport.a \
 	iothub_client/libiothub_client_mqtt_transport.a \
-	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
+	iothub_service_client/libiothub_service_client.a \
+	serializer/libserializer.a \
+	umqtt/libumqtt.a
 else
-AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
-	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
+AZURE_IOT_SDK_C_LIBS += \
+	uamqp/libuamqp.so \
+	c-utility/libaziotsharedutil.so \
+	iothub_client/libiothub_client.so \
+	iothub_client/libiothub_client_mqtt_ws_transport.so \
 	iothub_client/libiothub_client_amqp_ws_transport.so \
 	iothub_client/libiothub_client_http_transport.so \
 	iothub_client/libiothub_client_amqp_transport.so \
 	iothub_client/libiothub_client_mqtt_transport.so \
-	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
+	iothub_service_client/libiothub_service_client.so \
+	serializer/libserializer.so \
+	umqtt/libumqtt.so
 endif
 
 define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
