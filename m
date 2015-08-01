From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 1 Aug 2015 18:40:49 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150801082515.GC8475@waldemar-brodkorb.de>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com> <55AF6B19.7010702@openwide.fr>
 <20150722162715.GC6432@waldemar-brodkorb.de> <55AFD881.6050702@openwide.fr>
 <55BA0093.1090101@openwide.fr> <20150801082515.GC8475@waldemar-brodkorb.de>
Message-ID: <55BCF691.80906@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 01/08/2015 10:25, Waldemar Brodkorb a ?crit :
> Hi Romain,
> Romain Naour wrote,
> 
>> Hi Waldemar,
>>
>> Le 22/07/2015 19:53, Romain Naour a ?crit :
>>> Hi Waldemar,
>>>
>>> Le 22/07/2015 18:27, Waldemar Brodkorb a ?crit :
>>>> Hi Romain,
>>>> Romain Naour wrote,
>>>>
>>>>>>>       x86_64 |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
>>>>>>
>>>>>> Another uClibc static linking problem. Waldemar?
>>>>>>
>>>>>
>>>>> Waldemar, I think you can skip this issue since I'm working on the efl bump to
>>>>> the latest release and I had to disable the efl package for uClibc-ng.
>>>>>
>>>>> I had a link issue:
>>>>> lib/eina/.libs/libeina.so: undefined reference to `mkstemps'
>>>>> It turn out that mkstemps and mkostemps are not available in uClibc-ng.
>>>>
>>
>> [snip]
>>
>>>
>>>> May be efl developers could be convinced to use something more standard like?
>>>> mkstemps() seems very glibc specific.
>>>
>>> Indeed, man pages says that mkstemps() is unstandardized.
>>
>> I built successfully the efl package with a musl toolchain yesterday.
>>
>> Musl have mkostemp, mkstemps, and mkostemps functions since v0.9.10
>>
>> http://git.musl-libc.org/cgit/musl/commit/?id=2cc63358cdb0309ca996ffe56ccf402c2f2f16d5
>>
>> There is a comment in WHATSNEW that mkostemp is future-POSIX
>> http://git.musl-libc.org/cgit/musl/commit/?id=7bec92e793d4b8a349796848cf43c7329b0f2ed0
>>
>> Rich Felker said about mkostemp():
>> "Technically mkostemp is nonstandard, but it's accepted for inclusion in Issue
>> 8, and so far the policy for such functions is to treat them as if they're
>> already in the standard."
>> http://www.openwall.com/lists/musl/2013/02/03/1
>>
>> So maybe it's time for uClibc-ng to include these functions ?
>>
>> Thoughts ?
> 
> Yeah, I think this would be fine. Do you have time to develop a 
> patch proposing the changes? I am a bit busy next week not sure if I
> get time to this.

I've sent this patch to the uclibc-ng mailing list:
http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000432.html

What do you think?
I did not test at runtime yet, just build tested...
Also, a test program could be added later.

Best regards,
Romain

> 
> best regards
>  Waldemar
> 
