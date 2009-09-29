From: Emmanuel Riou <emmanuel.riou@toumaz.com>
Date: Tue, 29 Sep 2009 10:12:23 +0100
Subject: [Buildroot] [PATCH] Add Swfdec Free flash library
In-Reply-To: <4AC0961E.100@gmail.com>
References: <1253892756-13583-1-git-send-email-riou.emmanuel@googlemail.com>	<87vdj6uach.fsf@macbook.be.48ers.dk>
	<4AC0961E.100@gmail.com>
Message-ID: <4AC1CF77.3070905@toumaz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There is a typo in the Swfdec patch I submitted yesterday. I have just 
resubmitted another one which fixes the typo (ohost-pkconfig instead of 
host-pkgconfig), please take this one into account and not the one I 
sent yesterday.

Kind regards,

Emmanuel.

Emmanuel Riou wrote:
> Peter Korsgaard wrote:
>>>>>>> "Emmanuel" == Emmanuel Riou <riou.emmanuel@googlemail.com> writes:
>>
>>  Emmanuel> Signed-off-by: Emmanuel Riou <riou.emmanuel@googlemail.com>
>>  Emmanuel> ---
>>
>> Thanks, a few remarks:
> Hi! Thanks for your remarks and sorry for the slow reply...
> 
>>
>>  Emmanuel> +++ b/package/multimedia/swfdec/Config.in
>>  Emmanuel> @@ -0,0 +1,27 @@
>>  Emmanuel> +config BR2_PACKAGE_SWFDEC
>>  Emmanuel> +    bool "swfdec"
>>  Emmanuel> +    select BR2_PACKAGE_LIBSOUP
>>  Emmanuel> +    select BR2_PACKAGE_LIBOIL
>>  Emmanuel> +    select BR2_PACKAGE_ALSA_LIB
>>  Emmanuel> +    help
>>  Emmanuel> +      Library to play Flash Files
>>  Emmanuel> +      http://swfdec.freedesktop.org/
>>
>> We normally have an empty line before the URL.
> Alright I fixed it.
> 
>>
>>  Emmanuel> +
>>  Emmanuel> +config BR2_PACKAGE_SWFDEC_GTK
>>  Emmanuel> +        bool "swfdec gtk"
>>  Emmanuel> +    depends on BR2_PACKAGE_SWFDEC
>>  Emmanuel> +    depends on BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
>>  Emmanuel> +    select BR2_PACKAGE_LIBGTK2
>>  Emmanuel> +    select BR2_PACKAGE_CAIRO_PNG
>>  Emmanuel> +    help
>>  Emmanuel> +      Enables swfdec-gtk 
>> Indentation is wrong for the depends/select lines (should be <tab>). We
>> normally don't use select for stuff with complicated dependencies like
>> gtk, so I think it would be nicer to simply depen on libgtk2 - Then you
>> can also get rid of the directfb || xorg7 stuff.
> OK fixed.
> 
>>
>> You furthermore have trailing spaces in the help text. Maybe the config
>> option and help text should say something like gtk support?
> You're right, it's a bit more verbose now.
> 
> 
>>
>>  Emmanuel> +
>>  Emmanuel> +config BR2_PACKAGE_SWFDEC_GSTREAMER
>>  Emmanuel> +        bool "swfdec gstreamer"
>>  Emmanuel> +    default y
>>  Emmanuel> +    depends on BR2_PACKAGE_SWFDEC   
>>  Emmanuel> +    select BR2_PACKAGE_GSTREAMER
>>  Emmanuel> +    select BR2_PACKAGE_GST_PLUGINS_BASE
>>  Emmanuel> +    help
>>  Emmanuel> +      Enables GStreamer support
>>
>> Same here (identation/trailing spaces). Why should this default to y? (I
>> don't know much about flash) Is swfdec not very useful without gstreamer
>> support?
> I removed the default line. I put it as "default y" because it was 
> needed in my case (not a good reason, I know ;-)). Swfdec relies on 
> Gstreamer for all the audio and video stuff, but it is not mandatory to 
> have it since you can have Flash files without audio nor video.
> 
>>
>>  Emmanuel> +#############################################################
>>  Emmanuel> +#
>>  Emmanuel> +# Swfdec
>>  Emmanuel> +#
>>  Emmanuel> +#############################################################
>>  Emmanuel> +SWFDEC_VERSION_MAJOR:=0.8
>>  Emmanuel> +SWFDEC_VERSION_MINOR:=4
>>  Emmanuel> +SWFDEC_VERSION = 
>> $(SWFDEC_VERSION_MAJOR).$(SWFDEC_VERSION_MINOR)
>>  Emmanuel> +
>>  Emmanuel> +SWFDEC_SOURCE:=swfdec-$(SWFDEC_VERSION).tar.gz
>>  Emmanuel> 
>> +SWFDEC_SITE:=http://swfdec.freedesktop.org/download/swfdec/$(SWFDEC_VERSION_MAJOR) 
>>
>>  Emmanuel> +SWFDEC_LIBTOOL_PATCH = NO
>>  Emmanuel> +SWFDEC_INSTALL_STAGING = YES
>>  Emmanuel> +SWFDEC_INSTALL_TARGET = YES
>>
>> You have a mix of styles here (:= vs =, spaces around =) - Is there any
>> reason for that?
> Sorry for this inconsistency, it's fixed as well!
> 
>>
>> Otherwise it looks good. Care to fix those issues and resubmit?
> Thanks, I am resubmitting the patch.
> 
> Emmanuel.
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
