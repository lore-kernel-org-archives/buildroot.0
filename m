From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 14 Apr 2019 22:12:08 +0200
Subject: [Buildroot] [PATCH] package/wpebackend-fdo: package needs
 wayland libegl
In-Reply-To: <0ab8f13f-225e-29cd-c1e5-7ca2c3897ed6@mind.be>
References: <20190401092612.4614-1-giulio.benetti@micronovasrl.com>
 <0ab8f13f-225e-29cd-c1e5-7ca2c3897ed6@mind.be>
Message-ID: <78a23226-2ec4-a2f5-26bb-5c84a68b5a07@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 14/04/2019 12:18, Arnout Vandecappelle ha scritto:
>   Hi Giulio,
> 
> On 01/04/2019 11:26, Giulio Benetti wrote:
>> Now wpebackend-fdo depends only on HAS_LIBEGL but if libegl is not of
>> wayland type, build breaks due to different EGLNativeWindowType types
>> depending on backends(fb,x11,wl).
>>
>> Add 'depend on BR2_PACKAGE_HAS_LIBEGL_WAYLAND' to Config.in to avoid
>> building if there is not a wayland egl backend.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/4f02b91f6ffffd194e09ed18c917b4f678b1a52d/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/wpebackend-fdo/Config.in | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
>> index 2f5f965403..7d5ffb1fe0 100644
>> --- a/package/wpebackend-fdo/Config.in
>> +++ b/package/wpebackend-fdo/Config.in
>> @@ -1,6 +1,6 @@
>>   comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic library and an OpenEGL-capable backend"
> 
>   Wayland should be mentioned here as well.

Oh yes.

>>   	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>                     ^^^^^^^^^^^^^^^^^^^^^^^ This can be removed I guess

Right.

>> -		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>> +		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>>   
>>   config BR2_PACKAGE_WPEBACKEND_FDO
>>   	bool "wpebackend-fdo"
>> @@ -10,6 +10,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
>>   	depends on BR2_USE_WCHAR # libglib2
>>   	depends on BR2_USE_MMU # libglib2
>>   	depends on BR2_PACKAGE_HAS_LIBEGL
> 
>   This as well.
Right.

Thanks for rievewing.
I'm going to send v2 patch.
Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
