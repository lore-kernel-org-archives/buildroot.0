From: Martin Bark <martin@barkynet.com>
Date: Sun, 5 Jun 2016 19:14:59 +0100
Subject: [Buildroot] [PATCH 4/4] package/nodejs: Update npm to use
	NODEJS_CONF_OPTS
In-Reply-To: <20160604100848.GD3852@free.fr>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
 <1464981346-11741-4-git-send-email-martin@barkynet.com>
 <20160604100848.GD3852@free.fr>
Message-ID: <CAFGQKxe2ov=tOHgMf_dfc5eBK9gJ_rZDk=cZ6PdhLG7cGPKDWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 4 June 2016 at 11:08, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2016-06-03 20:15 +0100, Martin Bark spake thusly:
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>> ---
>>  package/nodejs/nodejs.mk | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> index aff73e8..f8f819f 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -33,6 +33,10 @@ else
>>  NODEJS_CONF_OPTS += --with-intl=none
>>  endif
>>
>> +ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
>> +NODEJS_CONF_OPTS += --without-npm
>> +endif
>> +
>>  # nodejs build system is based on python, but only support python-2.6 or
>>  # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
>>  define HOST_NODEJS_CONFIGURE_CMDS
>> @@ -109,7 +113,6 @@ define NODEJS_CONFIGURE_CMDS
>>               PYTHON=$(HOST_DIR)/usr/bin/python2 \
>>               $(HOST_DIR)/usr/bin/python2 ./configure \
>>               --prefix=/usr \
>> -             $(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>>               --dest-cpu=$(NODEJS_CPU) \
>>               $(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
>>               $(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \
>
> IMHO, it would have been good to also handle the remaining, arch options
> with the _CONF_OPTS variable as well.

yes i agree.  I will submit some other patches to handle them too.

Thanks

Martin

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
