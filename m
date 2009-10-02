From: William Wagner <will_wagner@carallon.com>
Date: Fri, 02 Oct 2009 10:05:51 +0100
Subject: [Buildroot] problem with locale
In-Reply-To: <87a5b0800910020200p3972c259yd46812807d7749f6@mail.gmail.com>
References: <4AC4D0C8.5000109@carallon.com>
	<87a5b0800910020200p3972c259yd46812807d7749f6@mail.gmail.com>
Message-ID: <4AC5C26F.4050608@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2009 10:00, Will Newton wrote:
>> It fails to build uClibc with this error:
>>    LN include/sys/vm86.h
>>    HOSTCC extra/locale/gen_wc8bit
>> extra/locale/gen_wc8bit.c: In function 'main':
>> extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
>> bounds
>> extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
>> bounds
>> extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
>> bounds
>>    GEN extra/locale/codesets.txt
>>    GEN extra/locale/c8tables.h
>> setlocale(LC_CTYPE,"en_US.UTF-8") failed!
>> make[1]: *** [extra/locale/c8tables.h] Error 1
>> make[1]: Leaving directory
>> `/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1'
>> make: ***
>> [/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1/.configured]
>> Error 2
>>      
> This looks like your host system does not support the en_US.UTF-8
> locale, although that would seem unlikely. Is it listed by locale -a?
>    

locale -a lists:
C
en_GB.utf8
POSIX

Is the easiest way of fixing this just going to be to add the extra locale?

Thanks.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
