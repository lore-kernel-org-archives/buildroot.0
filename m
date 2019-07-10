From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 23:57:20 +0200
Subject: [Buildroot] [PATCH v2 4/6] package/gstreamer1/gst1-plugins-bad:
 convert package type to meson
In-Reply-To: <20190710230805.6536effa@gmx.net>
References: <20190710153634.25235-1-aduskett@gmail.com>
 <20190710153634.25235-5-aduskett@gmail.com> <20190710230805.6536effa@gmx.net>
Message-ID: <8b125b3f-4a7f-53c4-b2a3-b44b32a9224a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 23:08, Peter Seiderer wrote:
> On Wed, 10 Jul 2019 11:36:32 -0400, aduskett at gmail.com wrote:
> 
>> From: Adam Duskett <Aduskett@gmail.com>
[snip]
>>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
>>  	bool "bluez"
>> -	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
>> -	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
>> -	depends on BR2_USE_MMU # bluez5_utils -> dbus
>> -	depends on !BR2_STATIC_LIBS # bluez5_utils -> uses dlfcn
>> -	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils -> conflicts with 4.x version
>> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
>> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
>> +	depends on BR2_USE_WCHAR # libglib2
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>> +	depends on BR2_USE_MMU # dbus
>> +	depends on !BR2_STATIC_LIBS # uses dlfcn
>> +	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> 
> Why all this comment changes? I believe the bluez5_utils comment makes it more clear
> where the dependencies come from...

 +1

 And anyway, it is not something related to conversion to meson.


 Regards,
 Arnout

[snip]
