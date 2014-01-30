From: Danny Gale <Daniel.Gale@coloradoengineeringinc.com>
Date: Thu, 30 Jan 2014 12:24:24 -0700
Subject: [Buildroot] powerpc64 support
In-Reply-To: <52EA9EE2.80807@zacarias.com.ar>
References: <52EA95DB.70504@coloradoengineeringinc.com>
 <52EA9EE2.80807@zacarias.com.ar>
Message-ID: <52EAA6E8.7000805@coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Thanks for getting back to me so quickly. Would it be preferred to add 
to Config.in.powerpc, or create Config.in.powerpc64?

Thanks,
Danny

On 01/30/2014 11:50 AM, Gustavo Zacarias wrote:
> On 01/30/2014 03:11 PM, Danny Gale wrote:
>
>> Hi all,
>>
>> We have used buildroot in the past to build filesystems for 32-bit
>> powerpc's with great success. Our newest boards are using 64-bit
>> powerpc's, however. Using menuconfig with buildroot 2013-11, I don't see
>> a target architecture for powerpc64. Is there support for 64-bit powerpc's?
>>
>> We're using an externally-generated toolchain, which is compiled for
>> 64-bit powerpc's, specifically the e6500 core
>> (powerpc64-e6500-linux-gnu-). Will selecting powerpc but using this
>> 64-bit toolchain generate 64-bit filesystems? I don't see the e6500
>> listed as a supported Target Architecture Variant either, but I believe
>> it can run 32-bit code generated for the e500 cores.
> Hi Danny.
> That's because nobody did the necessary modifications yet.
> You'd need to add 64 bit cores/defines into arch/Config.in.ppc and
> arch/Config.in, and adjust all the available toolchain options for them.
> IIRC the e6500 can execute e500mc code, but not e500v* since the later
> use SPE instead of a normal FPU (which i think the e6500 doesn't carry
> over, using the classic & altivec IIRC).
> It may be possible to build internal toolchains too given the appropiate
> component (binutils/gcc) versions.
> uClibc definitely doesn't handle ppc64, so that would just leave
> glibc/eglibc in the libc department.
> Regards.
>
