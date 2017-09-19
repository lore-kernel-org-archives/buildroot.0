From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 19 Sep 2017 12:43:05 +0200
Subject: [Buildroot] [PATCH v2 10/11] package/glibc: bump to 2.26
In-Reply-To: <0ru69ex7qp.ln2@ID-313208.user.individual.net>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-11-romain.naour@gmail.com>
 <0ru69ex7qp.ln2@ID-313208.user.individual.net>
Message-ID: <ED1EC6B2-A2CC-4F3B-84C3-9403224AE52B@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 19 septembre 2017 09:50:24 GMT+02:00, Bernd Kuhls <bernd.kuhls@t-online.de> a ?crit :
>Am Sat, 02 Sep 2017 22:54:22 +0200 schrieb Romain Naour:
>
>> --- a/package/glibc/glibc.mk
>> +++ b/package/glibc/glibc.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  
>################################################################################
>>  
>> -GLIBC_VERSION = 2.25
>> +GLIBC_VERSION = 2.26
>>  GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
>>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
>>  GLIBC_SRC_SUBDIR = .
>
>Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for testing!

I've reported a bug to glibc about C++ build issue. It seems a regression on x86_64.

See https://sourceware.org/bugzilla/show_bug.cgi?id=22146

I continue to work on it when time allow.

For now, this series must be delayed until the bug is fixed. This should allow to remove kodi, mesa and jsoncpp patches.

Best regards,
Romain

>[build-tested using this defconfig:
>BR2_x86_64=y
>BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>BR2_TOOLCHAIN_BUILDROOT_CXX=y
>BR2_PACKAGE_KODI=y
>BR2_PACKAGE_MESA3D=y
>BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
>BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>BR2_PACKAGE_XORG7=y
>BR2_PACKAGE_PYTHON=y
>BR2_PACKAGE_PYTHON_PY_ONLY=y]
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Envoy? de mon appareil Android avec K-9 Mail. Veuillez excuser ma bri?vet?.
