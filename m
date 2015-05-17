From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 17 May 2015 09:16:06 -0400
Subject: [Buildroot] [PATCH] libsodium: new package
In-Reply-To: <20150517033421.GB2845@tarshish>
References: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
 <20150517033421.GB2845@tarshish>
Message-ID: <CA+-urNSFevLF8ym4spT7oQ34moLA63ACyQci3kM2M7z4MeKMkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sat, May 16, 2015 at 11:34 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Frank,
>
> On Sat, May 16, 2015 at 07:38:55PM -0400, Frank Hunleth wrote:
>> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
>> new file mode 100644
>> index 0000000..9445f5a
>> --- /dev/null
>> +++ b/package/libsodium/libsodium.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# libsodium
>> +#
>> +################################################################################
>> +
>> +LIBSODIUM_VERSION = 1.0.3
>> +LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/${LIBSODIUM_VERSION}
>> +LIBSODIUM_LICENSE = ISC
>> +LIBSODIUM_LICENSE_FILES = LICENSE
>> +LIBSODIUM_INSTALL_STAGING = YES
>> +
>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>
> What is the use of the host package?

I have a project that was using it for part of the build process so I
needed libsodium for both the host and target. I wasn't sure what the
Buildroot policy was for seemingly unnecessary host packages like
this. It's not a big deal for me to patch locally.

Thanks,
Frank

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
