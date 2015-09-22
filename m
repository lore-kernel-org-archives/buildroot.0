From: =?utf-8?B?5bed5bO2IOa1qQ==?= <kei-k@ca2.so-net.ne.jp>
Date: Tue, 22 Sep 2015 19:33:08 +0900
Subject: [Buildroot] [PATCH v9 1/1] squeezelite: new package
In-Reply-To: <1442912056.5410.29.camel@embedded.rocks>
References: <201509220826.t8M8QvuY012965@ms-omx01.plus.so-net.ne.jp>
 <1442912056.5410.29.camel@embedded.rocks>
Message-ID: <72E4955F-ACF1-4925-AC83-FDFE5D9D0D8D@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, take it please, post next.

> 2015/09/22 17:54?J?rg Krause <joerg.krause@embedded.rocks> ?????
> 
> Dear Hiroshi Kawashima,
> 
> On Di, 2015-09-22 at 17:26 +0900, kei-k at ca2.so-net.ne.jp wrote:
>> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> 
> No revision changelog. Please have a look at the Buildroot manual:
> http://nightly.buildroot.org/#_providing_patches
> 
>> ---
>> package/Config.in                  |    1 +
>> package/squeezelite/Config.in      |   26 ++++++++++++++++++++++++++
>> package/squeezelite/squeezelite.mk |   27
>> +++++++++++++++++++++++++++
>> 3 files changed, 54 insertions(+), 0 deletions(-)
>> create mode 100644 package/squeezelite/Config.in
>> create mode 100644 package/squeezelite/squeezelite.mk
>> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 5158371..2a47420 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -33,6 +33,7 @@ menu "Audio and video applications"
>> 	source "package/opus-tools/Config.in"
>> 	source "package/pulseaudio/Config.in"
>> 	source "package/sox/Config.in"
>> +	source "package/squeezelite/Config.in"
>> 	source "package/tidsp-binaries/Config.in"
>> 	source "package/tovid/Config.in"
>> 	source "package/tstools/Config.in"
>> diff --git a/package/squeezelite/Config.in
>> b/package/squeezelite/Config.in
>> new file mode 100644
>> index 0000000..96efb7c
>> --- /dev/null
>> +++ b/package/squeezelite/Config.in
>> @@ -0,0 +1,26 @@
>> +config BR2_PACKAGE_SQUEEZELITE
>> +	bool "squeezelite"
>> +	depends on BR2_USE_WCHAR # flac
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
>> +	depends on BR2_USE_MMU # mpg123
>> +	select BR2_PACKAGE_ALSA_LIB
>> +	select BR2_PACKAGE_FLAC
>> +	select BR2_PACKAGE_LIBMAD
>> +	select BR2_PACKAGE_LIBVORBIS
>> +	select BR2_PACKAGE_FAAD2
>> +	select BR2_PACKAGE_MPG123
>> +	help
>> +	  Logitech Media Server client
>> +	  https://code.google.com/p/squeezelite/
> 
> Buildroot uses a newline between the description and the URL.
> 
>> +
>> +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
>> +	bool "Enable resampling function"
>> +	default n
> 
> "default n" is set implicitly and not needed here.
> 
> [snip]
> 
> Did you see my comments to the squeezelite.mk file in the last patch
> (v8)?
> 
> Best regards
> J?rg Krause
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
