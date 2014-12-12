From: Thierry Bultel <tbultel@free.fr>
Date: Fri, 12 Dec 2014 23:43:09 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses: add support for 256 colors
In-Reply-To: <20141211181431.GA4199@free.fr>
References: <1418122710-27852-1-git-send-email-tbultel@free.fr>
 <5486E958.9070404@zacarias.com.ar> <54870BA3.2010205@free.fr>
 <20141211181431.GA4199@free.fr>
Message-ID: <548B6F7D.8030902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/12/2014 19:14, Yann E. MORIN a ?crit :
> Thierry, All,
>
> On 2014-12-09 15:48 +0100, Thierry Bultel spake thusly:
>> Le 09/12/2014 13:21, Gustavo Zacarias a ?crit :
>>> On 12/09/2014 07:58 AM, Thierry Bultel wrote:
>>>
>>>> +config BR2_PACKAGE_NCURSES_EXT_COLORS
>>>> +	bool "ncurses extended colors"
>>>> +	select BR2_PACKAGE_NCURSES_WCHAR
>>>> +	depends on BR2_USE_WCHAR
>>>> +	help
>>>> +	  compile for 256-color support
>>>> +
>>>
>>> Hi.
>>> Do you know the size delta between this option enabled and disabled?
>>> I'm asking because it might not be even worth an option.
>>> Thanks.
>>> Regards.
>>>
>>
>> Hi, the size delta is quite small:
>>
>> 256 colors:
>>
>> -rwxr-xr-x 1 thierry thierry 210K d?c.   9 14:23
>> output/target/usr/lib/libncursesw.so.6.0
>>
>> std colors:
>>
>> -rwxr-xr-x 1 thierry thierry 202K d?c.   9 15:46
>> output/target/usr/lib/libncursesw.so.5.9
>
> Then, I'd say we just enable it by default, since the size delta is
> negligible (~4%).
>

Shall I then repost the patch with 256 colors enabled by default ?

> There is only one case that would require that to be an option: if it
> changes the API, and packages that do not expect it would break.
>
> Regards,
> Yann E. MORIN.
>
