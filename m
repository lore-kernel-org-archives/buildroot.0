From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Nov 2010 16:23:53 -0300
Subject: [Buildroot] ping: Sparc Leon patches
In-Reply-To: <4CDA5DE9.4030007@gaisler.com>
References: <4CD80E7E.9020708@gaisler.com> <4CD97A19.4020900@zacarias.com.ar>
	<4CDA5DE9.4030007@gaisler.com>
Message-ID: <4CDC42C9.9080303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/10 05:55, Konrad Eisele wrote:

> Gustavo Zacarias wrote:
>> On 11/08/10 11:51, Konrad Eisele wrote:
>>
>>> patches follow
>>
>> Tested and added to my repo so it probably will be in for 2010.11 as
>> discussed with Thomas on IRC.
>> One problem i've found is that when i build for a v7 target (doesn't
>> matter if it's leon or generic) libgomp in gcc seems to fail badly, is
>> it known?
> 
> Hi, Uclibc disables shared libraries for V7 by default . Its on my todo list
> to remove this constrains. It shouldnt matter weather V7 or V8
> when creating shared librares.
> For v7 targets I in the meantme use:
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp"

We can probably disable libgomp for v7 automatically in buildroot, i'll
give it a shot tomorrow time allowing.

>> And do you have patches for other versions of gcc like 4.3.x or 4.5.x to
>> include in the future?
> 
> Yes. I'll send the gcc patches to the gcc-patch list also. I
> just got permssion by the fsf.
> I'll also put it on my todo list to add  4.3.x and further patches.
> 
> -- Thanks Konrad

Ok, will be nice to have them when they're available.
In the mean time i've restricted the gcc selection in BR to 4.4.x for LEON.

> ps. I appended the 4 patches again. The [4/4] patch that adds
> long double gcc intrinscs support (from glibc) to uclibc didnt
> come through. Maybe because it is too big?...

Yes, the uclibc patch is huge so it's probably pending approval for the
list.
Has this patch been sent to the uclibc people to include?
All of this is in my repo for the time being so it's still pending
Peter's approval to include in the final release.
Thanks.
