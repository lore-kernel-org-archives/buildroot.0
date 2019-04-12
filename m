From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Apr 2019 23:40:03 +0200
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: should also
 install libparson (otherwise linking errors in userspace applications)
In-Reply-To: <d9eb67a8-b8fd-f890-1d02-c454c2313369@logicway.de>
References: <d9eb67a8-b8fd-f890-1d02-c454c2313369@logicway.de>
Message-ID: <702e8997-62c3-47aa-7065-76b4aa59e990@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Arndt,

 Thank you for your patch. However, before we can merge it, you have to provide
your Signed-off-by tag.  This is a short way for you to assert that you are
entitled to contribute the patch under buildroot's GPL license.  See
http://elinux.org/Developer_Certificate_Of_Origin for more details.

 Also, we prefer to get patches from git, though this one happens to work as well.

 The subject line of the mail (or the first line of the git commit message)
should be much shorter. For example, the commit message could be:

package/azure-iot-sdk-c: bump version to 2019-03-18

This version adds the libparson library, so that needs to be installed as well.

Signed-off-by: ... <...@...>


On 12/04/2019 09:53, Arndt Kritzner wrote:
> --- buildroot-2019.02.1.original/package/azure-iot-sdk-c/azure-iot-sdk-c.mk	2019-03-29 23:52:57.000000000 +0100
> +++ buildroot-2019.02.1.2/package/azure-iot-sdk-c/azure-iot-sdk-c.mk	2019-04-09 16:02:14.412271020 +0200
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
> 
> -AZURE_IOT_SDK_C_VERSION = 2018-12-13
> +AZURE_IOT_SDK_C_VERSION = 2019-03-18

 Is this version bump intentional? Actually, I suspect that libparson is
introduced by this version bump - AFAIK version 2018-12-13 doesn't have it.
That's why in the example commit message I changed the subject line into "bump
version".

>  AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
>  AZURE_IOT_SDK_C_SITE_METHOD = git
>  AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
> @@ -23,7 +23,7 @@
>  	iothub_client/libiothub_client_http_transport.a \
>  	iothub_client/libiothub_client_amqp_transport.a \
>  	iothub_client/libiothub_client_mqtt_transport.a \
> -	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
> +	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a libparson.a

 This line was already too long (we try to split at 80 characters). Could you
split it before the umqtt as part of this patch? Or even put just a single
library per line.

>  else
>  AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
>  	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
> @@ -31,7 +31,7 @@
>  	iothub_client/libiothub_client_http_transport.so \
>  	iothub_client/libiothub_client_amqp_transport.so \
>  	iothub_client/libiothub_client_mqtt_transport.so \
> -	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
> +	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so libparson.so

 Same here, of course.

 Regards,
 Arnout

>  endif
> 
>  define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
> 
> 
> ===============================================================================
> Kind regards
> Arndt
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
