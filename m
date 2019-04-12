From: Arndt Kritzner <kritzner@logicway.de>
Date: Fri, 12 Apr 2019 09:53:40 +0200
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: should also install
 libparson (otherwise linking errors in userspace applications)
Message-ID: <d9eb67a8-b8fd-f890-1d02-c454c2313369@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- buildroot-2019.02.1.original/package/azure-iot-sdk-c/azure-iot-sdk-c.mk	2019-03-29 23:52:57.000000000 +0100
+++ buildroot-2019.02.1.2/package/azure-iot-sdk-c/azure-iot-sdk-c.mk	2019-04-09 16:02:14.412271020 +0200
@@ -4,7 +4,7 @@
 #
 ################################################################################

-AZURE_IOT_SDK_C_VERSION = 2018-12-13
+AZURE_IOT_SDK_C_VERSION = 2019-03-18
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
@@ -23,7 +23,7 @@
 	iothub_client/libiothub_client_http_transport.a \
 	iothub_client/libiothub_client_amqp_transport.a \
 	iothub_client/libiothub_client_mqtt_transport.a \
-	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
+	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a libparson.a
 else
 AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
 	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
@@ -31,7 +31,7 @@
 	iothub_client/libiothub_client_http_transport.so \
 	iothub_client/libiothub_client_amqp_transport.so \
 	iothub_client/libiothub_client_mqtt_transport.so \
-	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
+	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so libparson.so
 endif

 define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS


===============================================================================
Kind regards
Arndt


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190412/990f278a/attachment.asc>
