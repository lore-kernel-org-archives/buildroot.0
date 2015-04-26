From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 21:53:06 +0200
Subject: [Buildroot] [PATCH 2/3] package/libpjsip: new package
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
 <1430060451-4075-3-git-send-email-bernd.kuhls@t-online.de>
 <20150426191246.5e1c5242@free-electrons.com>
Message-ID: <XnsA488DEA098AE3berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

v2 will contain the following changes:

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150426191246.5e1c5242 at free-electrons.com:

>> +++ b/package/libpjsip/0001-disable-tests.patch
>> @@ -0,0 +1,12 @@
> 
> Missing patch description + SoB.

I removed this patch because the test binaries require ipv6 support and I 
wanted to avoid that dependency. This is not necessary anymore :)

> License + license files?

Done.

>> +ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
>> +LIBPJSIP_CONF_OPTS += --with-external-pa
>> +LIBPJSIP_DEPENDENCIES += portaudio
>> +endif
> 
> Can you add a 'else' clause to explicitly disable portaudio support?

No, because otherwise pjsip will use its internal portaudio files in 
third_party/portaudio/. I changed portaudio to a hard dependency...

>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
>> +LIBPJSIP_DEPENDENCIES += util-linux
> 
> Any way to --enable/--disable this?

No, since aconfigure.ac has no support for this:

AC_CHECK_LIB(uuid,uuid_generate)
AC_CHECK_LIB(uuid,uuid_generate,[ac_has_uuid_lib=1])

Regards, Bernd
