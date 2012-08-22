From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 22 Aug 2012 11:58:17 +0300
Subject: [Buildroot] [PATCH] valgrind: valgrind/valgrind.h missing if
 --disable-tls enabled
In-Reply-To: <50340AD0.501@mind.be>
References: <1344801370-14582-1-git-send-email-stefan.froberg@petroprogram.com>
 <1344801370-14582-2-git-send-email-stefan.froberg@petroprogram.com>
 <50340AD0.501@mind.be>
Message-ID: <50349F29.5000809@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Arnout

22.8.2012 1:25, Arnout Vandecappelle kirjoitti:
> On 08/12/12 21:56, Stefan Froberg wrote:
>> +ifeq ($(BR2_GCC_ENABLE_TLS),y)
>> +    VALGRIND_CONF_OPT = --enable-tls
>> +else
>> +    VALGRIND_CONF_OPT = --disable-tls
>> +endif
>
>  This will only work for buildroot toolchains, not for crosstool-NG or
> external
> toolchains...
>
>

Hmmm...
How about this then?

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y) && ($(BR2_GCC_ENABLE_TLS),y)
        VALGRIND_CONF_OPT = --enable-tls
else
        VALGRIND_CONF_OPT = --disable-tls
endif

Enabling only tls if using buildroot toolchain and tls selected in gcc
and otherwise disabled.

Stefan

>
>  Regards,
>  Arnout
>
