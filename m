From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 05 Mar 2015 19:37:07 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix a runtime bug (no text
 displayed in GUI) when an external glibc toolchain is used
In-Reply-To: <20150304221100.18c7ff17@free-electrons.com>
References: <1425502935-18002-1-git-send-email-julien.boibessot@free.fr>
 <20150304221100.18c7ff17@free-electrons.com>
Message-ID: <54F8A253.6090504@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 03/04/2015 10:11 PM, Thomas Petazzoni wrote:
> Dear julien.boibessot at free.fr,
>
> On Wed,  4 Mar 2015 22:02:15 +0100, julien.boibessot at free.fr wrote:
>
>> +# Otherwise no text is displayed in user interface when compiled with an
>> +# external glibc toolchain (iconv_open() is required at runtime for UTF-8 to
>> +# UTF-32 conversion)
>> +comment "kodi needs an external glibc toolchain which copy gconv libraries"
>> +	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS && BR2_TOOLCHAIN_EXTERNAL_GLIBC
>> +	depends on !BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
> As suggested by Yann, what about:
>
> 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_EXTERNAL_GLIBC
>
>  ?

I didn't know it was possible, :-), so let me check it and come back to
you ASAP.

Regards,
Julien
