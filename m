From: Will Newton <will.newton@gmail.com>
Date: Fri, 2 Oct 2009 10:45:56 +0100
Subject: [Buildroot] problem with locale
In-Reply-To: <4AC5C26F.4050608@carallon.com>
References: <4AC4D0C8.5000109@carallon.com>
	<87a5b0800910020200p3972c259yd46812807d7749f6@mail.gmail.com>
	<4AC5C26F.4050608@carallon.com>
Message-ID: <87a5b0800910020245k7a39d172r5899c1cb14718e2d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 2, 2009 at 10:05 AM, William Wagner
<will_wagner@carallon.com> wrote:
> On 02/10/2009 10:00, Will Newton wrote:
>>>
>>> It fails to build uClibc with this error:
>>> ? LN include/sys/vm86.h
>>> ? HOSTCC extra/locale/gen_wc8bit
>>> extra/locale/gen_wc8bit.c: In function 'main':
>>> extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
>>> bounds
>>> extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
>>> bounds
>>> extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
>>> bounds
>>> ? GEN extra/locale/codesets.txt
>>> ? GEN extra/locale/c8tables.h
>>> setlocale(LC_CTYPE,"en_US.UTF-8") failed!
>>> make[1]: *** [extra/locale/c8tables.h] Error 1
>>> make[1]: Leaving directory
>>> `/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1'
>>> make: ***
>>> [/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1/.configured]
>>> Error 2
>>>
>>
>> This looks like your host system does not support the en_US.UTF-8
>> locale, although that would seem unlikely. Is it listed by locale -a?
>>
>
> locale -a lists:
> C
> en_GB.utf8
> POSIX
>
> Is the easiest way of fixing this just going to be to add the extra locale?

Yes, that will be the easiest way. I would not recommend looking at
the locale code!
