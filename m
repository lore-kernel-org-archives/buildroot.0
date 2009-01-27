From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 27 Jan 2009 12:47:31 +0000
Subject: [Buildroot] alsa lib problem
In-Reply-To: <20090127134408.2c74b516@hcegtvedt>
References: <497E0B14.8040801@carallon.com>	<87ocxt2t8g.fsf@macbook.be.48ers.dk>	<497EFEDC.3040606@carallon.com>
	<20090127134408.2c74b516@hcegtvedt>
Message-ID: <497F0263.80302@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt wrote:
> On Tue, 27 Jan 2009 12:32:28 +0000
> Will Wagner <will_wagner@carallon.com> wrote:
> 
>> Peter Korsgaard wrote:
>>> We unconditinally add the largefile stuff to TARGET_CFLAGS, which
>>> apparently isn't a good idea for alsa.
>>>
>>> If the kernel interface is always with an 32bit offset, then
>>> asound.h should probably be changed to use a 32bit data type
>>> instead. Could you try changing it to an unsigned int and recompile?
>> Yes is I change the asound.h header it does work.
>>
>> What is the best way to proceed from here? Just patch alsa?
>>
> 
> Make a patch for alsa, and send it upstream to the alsa maintainers.
> They need to fix broken code like this anyway.

Happy to prepare a patch for upstream. However can someone explain to me what is broken in 
alsa? Looking at the code the declaration of the struct is identical in the kernel code 
and the copy of the header in alsa. How is it that the size of off_t is different?

Thanks,

Will.

> 
> <snipp>
> 

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
