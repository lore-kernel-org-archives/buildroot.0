From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 12:08:05 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/gdb: add gdb 7.7.1
In-Reply-To: <20140511235400.67d6ac5f@free-electrons.com>
References: <1399842673-21261-1-git-send-email-cody@linux.vnet.ibm.com>
 <1399842673-21261-2-git-send-email-cody@linux.vnet.ibm.com>
 <20140511235400.67d6ac5f@free-electrons.com>
Message-ID: <53711C15.5010909@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/2014 02:54 PM, Thomas Petazzoni wrote:
> Dear Cody P Schafer,
>
> I had a fairly similar patch sitting in my patch stack.
>
> On Sun, 11 May 2014 14:11:13 -0700, Cody P Schafer wrote:
>
>> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
>> index e853469..77c5459 100644
>> --- a/package/gdb/Config.in.host
>> +++ b/package/gdb/Config.in.host
>> @@ -19,7 +19,7 @@ choice
>>   	depends on !BR2_microblaze
>>   	default BR2_GDB_VERSION_6_6 if BR2_bfin
>>   	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
>> -	default BR2_GDB_VERSION_7_5
>> +	default BR2_GDB_VERSION_7_7
>
> I'm not sure we want to jump straight to 7.7 for all architectures.
> We're usually a bit conservative with regard to the version of toolchain
> components. So I'd suggest instead to add 7.6 and 7.7. Make 7.6 the new
> default for all architectures except PPC64, and make 7.6 unavailable
> for PPC64, and therefore select 7.7 for PPC64. Of course, all older gdb
> versions should be unavailable for PPC64.

So long as s/PPC64/PPC64le/, sure.

> Speaking of component versions, your PATCH 1/2 indicates that gcc 4.9
> and glibc 2.19 are needed for PPC64. Can you make sure that the
> relevant toolchain component versions dependencies are added, so that
> users can't select a too old glibc version, or a too old gcc version?

Will do.

> Another question is: are there some existing, publicly available,
> pre-built toolchain for PPC64 ?

https://www.kernel.org/pub/tools/crosstool/ has a ppc64 one (without a 
libc). I'm not aware of one shipping with a libc.
I don't know of any ppc64le prebuilt toolchains.

> My last question is: how far goes your interest for PPC64 ? When we
> start supporting a new architecture in Buildroot, we generally add it
> in the autobuilders, which means that a significant portion of the
> Buildroot packages get built against this new architecture. This often
> raises a number of build failures. Would you be willing to help fixing
> those? To help doing this, we generally offer to people in charge of a
> given architecture to receive a daily e-mail listing the build failures
> that occurred on that architecture. A good thing is that this helps the
> persons maintaining this infrastructure notice which userspace packages
> need to be taken care of.

I'm really only doing this because I end up using buildroot to build 
netboot images to test kernel changes I make on real hardware.
It's entirely a yak shaving project to me.

That said, I'm fine with getting emails, but can't promise anything 
about actually helping fix things.
