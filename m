From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 18:00:25 +0100
Subject: [Buildroot] [PATCH] libass: allow compilation without a system
 font provider
References: <1449505148-9046-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151208171627.GO4188@free.fr> <5668002F.90802@imgtec.com>
 <20151209172813.GA3743@free.fr> <56686530.3060209@imgtec.com>
Message-ID: <9qk0kcx3eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 09 Dec 2015 17:30:24 +0000 schrieb Vicente Olivert Riera:

> Hi Yann,
> 
> On 09/12/15 17:28, Yann E. MORIN wrote:
>> Vicente, All,
>> 
>> On 2015-12-09 10:19 +0000, Vicente Olivert Riera spake thusly:
>>> On 08/12/15 17:16, Yann E. MORIN wrote:
>>>> On 2015-12-07 16:19 +0000, Vicente Olivert Riera spake thusly:
>>>>>  
>>>>> +# Allow compilation without a system font provider
>>>>> +LIBASS_CONF_OPTS = --disable-require-system-font-provider
>>>>
>>>> It is my understanding that fontconfig *is* a "system font provider",
>>>> so maybe that should go n the else-case for fontconfig, below?
>>>>
>>>>>  ifeq ($(BR2_PACKAGE_FONTCONFIG),y) LIBASS_DEPENDENCIES +=
>>>>>  fontconfig LIBASS_CONF_OPTS += --enable-fontconfig
>>>> Here:
>>>>
>>>>     else LIBASS_CONF_OPTS += \
>>>>         --disable-fontconfig \ --disable-require-system-font-provider
>>>>     endif

Hi Vicente, hi Yann,

reading your comments about this problem I created a patch
http://patchwork.ozlabs.org/patch/556201/
combining both of your approaches, what do you think?

Regards, Bernd
