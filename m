From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Feb 2012 14:03:48 +0100
Subject: [Buildroot] ltrace hangings
In-Reply-To: <201202282333.58717.yann.morin.1998@free.fr>
References: <4F4D052C.3030608@free-electrons.com>
 <201202282333.58717.yann.morin.1998@free.fr>
Message-ID: <4F4E2234.7030301@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 28/02/2012 23:33, Yann E. MORIN wrote:
> On Tuesday 28 February 2012 17:47:40 Maxime Ripard wrote:
>> I'm having a hard time here using ltrace with buildroot or crosstool-ng.
>>
>> Basically, with a crosstool-NG 1.13.4, with the sample
>> arm-unknown-linux-gnueabi (so uclibc 0.9.30.2), I get :
>> __uClibc_main(52956, 2, 0xbec42db4, 47280, 521292
>> and it hangs.
>>
>> Same thing with a toolchain built by buildroot and with uclibc 0.9.32.
>>
>> Finally, I tried still with buildroot, but using the latest codebench
>> glibc toolchain, I get:
>>
>> # ltrace cat /proc/self/cmdline
>> __libc_start_main(53812, 2, 0xbefeedb4, 518624, 518824
>>
>> Is it a wild guess to think that ltrace 0.5.3 is buggy, or am I doing
>> something wrong ?
> 
> 0.5.3 is now a bit old (2 years), and there has been a new release
> about four months ago:
>   http://anonscm.debian.org/gitweb/?p=collab-maint/ltrace.git;a=summary
> 
> Maybe it's time we upgrade crosstool-NG to this new version...

I've upgraded the package in buildroot to 0.6.0, and same problem here
on ARM. However, it works fine on x86 either using directly their
build-system and Ubuntu's gcc or using buildroot's internal toolchain
for x86 (with uClibc).

It seems like the bug is probably more arch-specific than I thought.


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
