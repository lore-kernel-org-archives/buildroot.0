From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 4 Oct 2015 19:04:43 +0200
Subject: [Buildroot] [PATCH] openal: New package
In-Reply-To: <ok37ecxrt1.ln2@ID-313208.user.individual.net>
References: <56100EB1.4010100@dawncrow.de>
 <ok37ecxrt1.ln2@ID-313208.user.individual.net>
Message-ID: <56115C2B.1080705@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.10.2015 um 10:12 schrieb Bernd Kuhls:
> Hi Andr?,
> 
> several months ago I started hacking an openal package myself but
> never finished it. Here I will compare my package to your version.
> 
> Am Sat, 03 Oct 2015 19:21:53 +0200 schrieb Andr? Hentschel:
> 
>> diff --git a/package/openal/Config.in b/package/openal/Config.in
>> new file mode 100644
>> index 0000000..8eb177b
>> --- /dev/null
>> +++ b/package/openal/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_OPENAL
>> +	bool "openal"
>> +	# OpenAL needs a backend
>> +	depends on BR2_PACKAGE_ALSA_LIB || \
>> +	           BR2_PACKAGE_PORTAUDIO || \
>> +	           BR2_PACKAGE_PULSEAUDIO
>> +	help
>> +	  OpenAL provides capabilities for playing audio in a virtual
>> +	  3D environment. Distance attenuation, doppler shift, and
>> +	  directional sound emitters are among the features handled by
>> +	  the API.
>> +
>> +comment "openal needs a backend"
>> +	depends on !BR2_PACKAGE_ALSA_LIB && \
>> +	           !BR2_PACKAGE_PORTAUDIO && \
>> +	           !BR2_PACKAGE_PULSEAUDIO
> 
> What about having a choice option defaulting to, for example, alsa?

I'll think about it

> Please add
> 
> 	http://kcat.strangesoft.net/openal.html

Done locally

> to Config.in. Openal also needs this
> 
> 	depends on BR2_TOOLCHAIN_HAS_THREADS
> 
> 	comment "openal needs a toolchain w/ threads"
> 		depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> Did you test a static build? I have this in openal.mk:
> 
> ifeq ($(BR2_STATIC_LIBS),y)
> OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
> endif

Done that locally, thanks.
I'll reiterate in a week hopefully.
Thank you very much for the comments!
