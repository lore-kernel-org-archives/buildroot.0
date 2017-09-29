From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 29 Sep 2017 23:49:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertuxkart: needs freetype
In-Reply-To: <CAAEAJfDr035OC8VSk0Gb2=G1NG1XmimWhr4QsSF+Qf0a847p0Q@mail.gmail.com>
References: <20170929190140.32645-1-bernd.kuhls@t-online.de>
 <CAAEAJfDr035OC8VSk0Gb2=G1NG1XmimWhr4QsSF+Qf0a847p0Q@mail.gmail.com>
Message-ID: <d2931ba4-ac61-0329-1fce-ecf9411e4093@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 29/09/2017 ? 21:04, Ezequiel Garcia a ?crit?:
> On 29 September 2017 at 16:01, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>> https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L231
>>
>> Build would fail without this patch using this defconfig:
>>
>> BR2_x86_64=y
>> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>> BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> BR2_PACKAGE_SUPERTUXKART=y
>> BR2_PACKAGE_MESA3D=y
>> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
>> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>> BR2_PACKAGE_XORG7=y
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/supertuxkart/Config.in       | 1 +
>>  package/supertuxkart/supertuxkart.mk | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
>> index 4919b50a2b..51759160eb 100644
>> --- a/package/supertuxkart/Config.in
>> +++ b/package/supertuxkart/Config.in
>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_SUPERTUXKART
>>         depends on BR2_PACKAGE_HAS_LIBGL
>>         depends on BR2_PACKAGE_XORG7
>>         depends on !BR2_TOOLCHAIN_USES_MUSL
>> +       select BR2_PACKAGE_FREETYPE
>>         select BR2_PACKAGE_JPEG
>>         select BR2_PACKAGE_LIBCURL
>>         select BR2_PACKAGE_LIBGLU
>> diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
>> index 7636687780..dc4b23227d 100644
>> --- a/package/supertuxkart/supertuxkart.mk
>> +++ b/package/supertuxkart/supertuxkart.mk
>> @@ -15,6 +15,7 @@ SUPERTUXKART_LICENSE = GPL-3.0+
>>  SUPERTUXKART_LICENSE_FILES = COPYING
>>
>>  SUPERTUXKART_DEPENDENCIES = \
>> +       freetype \
>>         jpeg \
>>         libcurl \
>>         libgl \
>> --
>> 2.11.0
>>
> 
> Looks good.
> 
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Reproduced here.

Acked-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Thanks,
> 
