From: Martin Bark <martin@barkynet.com>
Date: Fri, 3 Jun 2016 20:15:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: add icu support
In-Reply-To: <20160603145137.38c3ca35@free-electrons.com>
References: <1464950477-3122-1-git-send-email-martin@barkynet.com>
 <20160603145137.38c3ca35@free-electrons.com>
Message-ID: <CAFGQKxcps5XXLwQmkUpkke67GdkhKA7s9ZyKXbwdtDNWvN_HOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 3 June 2016 at 13:51, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  3 Jun 2016 11:41:16 +0100, Martin Bark wrote:
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>  package/nodejs/nodejs.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> index b0661ed..0329299 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -17,6 +17,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>  NODEJS_DEPENDENCIES += openssl
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_ICU),y)
>> +NODEJS_DEPENDENCIES += icu
>> +endif
>> +
>>  # nodejs build system is based on python, but only support python-2.6 or
>>  # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
>>  define HOST_NODEJS_CONFIGURE_CMDS
>> @@ -96,6 +100,7 @@ define NODEJS_CONFIGURE_CMDS
>>               --without-snapshot \
>>               --shared-zlib \
>>               $(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
>> +             $(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
>>               $(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>>               --without-dtrace \
>>               --without-etw \
>
> I've applied, because it's already done this way for OpenSSL. But I
> prefer when the dependency and the configure option is added at the
> same place, i.e
>
> ifeq ($(BR2_PACKAGE_ICU),y)
> NODEJS_DEPENDENCIES += icu
> NODEJS_CONF_OPTS += --with-intl=system-icu
> else
>  NODEJS_CONF_OPTS += --with-intl=none
> endif
>
> If you want to improve this in nodejs.mk, don't hesitate to send a
> follow-up patch. Thanks!

I just submitted a patch set to fix this

Thanks

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
