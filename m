From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 22 Mar 2015 19:51:06 +0100
Subject: [Buildroot] [PATCH v2] package/kodi: fix a runtime bug (no text
 displayed in GUI) when a glibc toolchain is used
In-Reply-To: <20150314172445.GB4009@free.fr>
References: <1425904718-24193-1-git-send-email-julien.boibessot@free.fr>
 <20150314172445.GB4009@free.fr>
Message-ID: <CAGduivwWT9n+KuG7782U57eiOC1jOfrgOBrFsvpsoruOqvgL-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Mar 14, 2015 at 6:24 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Julien, All,
>
> On 2015-03-09 13:38 +0100, julien.boibessot at free.fr spake thusly:
>> From: Julien Boibessot <julien.boibessot@armadeus.com>
>>
>> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>> Changes since v1:
>>  * took Yann suggestion into account
>>  * smaller comment
>>  * problem also occurs on non external glibc toolchains
>>
>>  package/kodi/Config.in |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
>> index 1bc8b15..91fca28 100644
>> --- a/package/kodi/Config.in
>> +++ b/package/kodi/Config.in
>> @@ -91,6 +91,7 @@ menuconfig BR2_PACKAGE_KODI
>>       select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
>>       select BR2_PACKAGE_YAJL
>>       select BR2_PACKAGE_ZLIB
>> +     select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
>>       depends on BR2_INET_IPV6
>>       depends on BR2_INSTALL_LIBSTDCPP
>>       depends on BR2_LARGEFILE
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
