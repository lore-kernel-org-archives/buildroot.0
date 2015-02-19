From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 19 Feb 2015 20:19:46 +0100
Subject: [Buildroot] [PATCH v6] wine: New package
In-Reply-To: <20150218220954.GA19555@free.fr>
References: <54E5058A.8080906@dawncrow.de> <20150218220954.GA19555@free.fr>
Message-ID: <54E63752.90106@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Am 18.02.2015 um 23:09 schrieb Yann E. MORIN:
> Andre, All,
> 
> On 2015-02-18 22:35 +0100, Andr? Hentschel spake thusly:
>> +WINE_DEPENDENCIES = host-bison host-flex host-wine
>> +
>> +# Wine needs to enable 64-bit build tools on 64-bit host
>> +ifeq ($(HOSTARCH),x86_64)
>> +	HOST_WINE_CONF_OPTS += --enable-win64
>> +endif
> 
> Please, keep all host-related stuff together. In this patch, you have
> some configure options here and at the end, and build+install commands
> here. Just move evrything host-related together (preferrably at the
> bottom of the file).

done for v7

>> +# Wine only needs the host tools to be built, so cut-down the
>> +# build time by building just what we need.
>> +HOST_WINE_BUILD_CMDS = \
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>> +	tools \
>> +	tools/widl \
>> +	tools/winebuild \
>> +	tools/winegcc \
>> +	tools/wmc \
>> +	tools/wrc
> 
> We use macros to define build commands:
> 
>     define HOST_WINE_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>             tools \
>             tools/widl \
>             tools/winebuild \
>             tools/winegcc \
>             tools/wmc \
>             tools/wrc
>     endef

done for v7

> 
> Why TARGET_MAKE_ENV? You should use HOST_MAKE_ENV, since you're building
> a host package at that point.

fixed in v7, i copy&pasted to much from you ;)

> Otherwise, looks good. I'm queueing that for further inspection + tests
> this WE.

thx
