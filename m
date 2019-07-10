From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 23:53:24 +0200
Subject: [Buildroot] [PATCH v2 3/6]
 package/gstreamer1/gst1-plugins-good: convert package type to meson
In-Reply-To: <20190710225203.0b81eec0@gmx.net>
References: <20190710153634.25235-1-aduskett@gmail.com>
 <20190710153634.25235-4-aduskett@gmail.com> <20190710225203.0b81eec0@gmx.net>
Message-ID: <ab41f678-9611-a6af-3314-ff2d643a7599@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 22:52, Peter Seiderer wrote:
> Hello Adam,
> 
> On Wed, 10 Jul 2019 11:36:31 -0400, aduskett at gmail.com wrote:

[snip]
>> -	--disable-osx_audio \
>> -	--disable-osx_video \
>> -	--disable-aalib \
>> -	--disable-aalibtest \
>> -	--disable-libcaca
>> +	-Dexamples=disabled \
>> +	-Dtests=disabled \
> 
> While your are at it , the following options should move to the
> 'Options which require currently unpackaged libraries' section
> some lines below:

 No, that should be done as a separate patch.

 It would also be nice BTW if all the options would be ordered alphabetically.
Now they're a bit of a hodgepodge.

[snip]
>>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
>> -GST1_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
>>  GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
>> -else
>> -GST1_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
>>  endif
> 
> Should be:
> 
>   # checked for by meson.build, gst/isomp4/meson.build, gst/matroska/meson.build
>   # and gst/icydemux/meson.build

 We don't add such a comment for any other package, so not needed.

>   ifeq ($(BR2_PACKAGE_ZLIB),y)
>   GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
>   endif
> 
> And option BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB removed from Config.in (and moved
> to Config.in.legacy)...

 This, however, is true. Legacy handling is not needed though: existing .configs
will just work unmodified, the option will disappear automatically when you do
'make olddefconfig' and zlib will still be selected.


 Regards,
 Arnout

[snip]
