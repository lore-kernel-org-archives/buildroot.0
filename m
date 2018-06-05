From: Laurent GONZALEZ <br22@gezedo.com>
Date: Tue, 5 Jun 2018 09:23:11 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <20180605074932.668ae4e7@windsurf>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
 <20180605074932.668ae4e7@windsurf>
Message-ID: <b6e193cb-d79d-3758-859a-e8c80933947f@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2018 07:49, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 5 Jun 2018 00:10:30 +0200, Arnout Vandecappelle wrote:
>
>>>  comment "Linux kernel may fail to boot with binutils >= 2.29"
>>> -	depends on BR2_ARM_CPU_ARMV7M
>>> +	depends on BR2_arm || BR2_armeb  
>>  I have a bit of a problem with this patch. IMO it's rather unlikely that people
>> build the kernel in THUMB mode on non-M CPUs.
> Are you sure ? There is definitely support for building a Thumb2 kernel
> on ARMv7-A, and I think it's a popular way to reduce a bit the size of
> the kernel, no?
I gently remember the list that we can alternatively fix the kernel with a patch.

This solution will allow any version of binutils to work with any version of the kernel, and can be easily reverted.

What about using:

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-March/565390.html

--
Laurent
