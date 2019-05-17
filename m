From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 17 May 2019 20:12:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <2bcdcce8-a6c0-c714-2f4f-8946afe68779@micronovasrl.com>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
 <7b7b2abd-69a6-33c0-a892-68cdcbc57b9a@micronovasrl.com>
 <2bcdcce8-a6c0-c714-2f4f-8946afe68779@micronovasrl.com>
Message-ID: <ade874ba-b8f8-a51a-6e64-3a1e140ec177@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 16/05/2019 23:38, Giulio Benetti ha scritto:
> Il 16/05/2019 23:35, Giulio Benetti ha scritto:
>> Hello Fabrice,
>>
>> Il 16/05/2019 22:12, Fabrice Fontaine ha scritto:
>>> Commit 5b3c7a3e7828107eaa9dad49ba2650466277d891 added a
>>> BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency to wpebackend-fdo but forget
>>> to add it to wpewebkit
>>>
>>> Fixes:
>>> ? - 
>>> http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf 
>>>
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> Reviewed-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Please discard this ^^^^^^^^^

Sorry, please keep my Reviewed-by.
Thanks

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

>>> ---
>>> ? package/wpewebkit/Config.in | 6 ++++--
>>> ? 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
>>> index 04ebe5452b..15db924829 100644
>>> --- a/package/wpewebkit/Config.in
>>> +++ b/package/wpewebkit/Config.in
>>> @@ -35,10 +35,11 @@ comment "wpewebkit needs a toolchain w/ C++, 
>>> wchar, threads, dynamic library, gc
>>> ????????? || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
>>> ????????? || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || 
>>> !BR2_HOST_GCC_AT_LEAST_4_8
>>> -comment "wpewebkit needs an OpenGL ES w/ EGL backend"
>>> +comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>>> ????? depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>>> ????? depends on !BR2_BINFMT_FLAT
>>> -??? depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
>>> +??? depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
>>> +??????? || !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>>> ? config BR2_PACKAGE_WPEWEBKIT
>>> ????? bool "wpewebkit"
>>> @@ -51,6 +52,7 @@ config BR2_PACKAGE_WPEWEBKIT
>>> ????? depends on BR2_USE_WCHAR # icu, libsoup
>>> ????? depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>>> ????? depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
>>> +??? depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
>>> ????? depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>>> ????? select BR2_PACKAGE_CAIRO
>>> ????? select BR2_PACKAGE_CAIRO_PNG
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
