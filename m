From: Anton Kuzmin <ak@aries-embedded.de>
Date: Sat, 14 Jul 2018 09:20:10 +0200
Subject: [Buildroot] RISC-V support
In-Reply-To: <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
References: <0fb21945-492b-520b-e859-b827429312bd@aries-embedded.de>
 <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
Message-ID: <bc6aecb5-1ae1-ebd8-5690-a65e13fe406a@aries-embedded.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13.07.2018 11:10, Arnout Vandecappelle wrote:
> 
> 
> On 13-07-18 10:34, Anton Kuzmin wrote:
>> Hello All,
>>
>> Is anybody already working on adding of the RISC-V [1] support
>> to buildroot?  If yes, is there any place to discuss/share the progress?
>> If not, are there any reasons not to do it?
> 
>  There is definitely no reason not to add support for it RISC-V.
> 
> 
>> As a starting point, I have made minimal additions resulting in
>> a successful build of the buildroot toolchain and sdk.
> 
>  Excellent!

Thank you and everybody else for a positive and encouraging reaction.

>  How about a kernel?

Not that far yet, perhaps is some weeks.

>> At the moment 64-bit only, gcc-7.3.0, glibc-2.27-57 -- from upstream.
> 
>  64-bit only seems a small constraint, IIUC the 32 and 64 bit variants are
> nearly identical, no?

AFAIK, 32-bit glibc support is available from risc-v repo on github,
but has not been merged upstream yet.  There seems to be some
differencies at least in atomic operations, may be something else.

Frankly, 32-bit toolchain is what I'm interested most at the moment.

>  Constraints on minimal versions of the toolchain components are expected. We
> even have BR2_ARCH_NEEDS_GCC_AT_LEAST_7 to handle that. It's used a lot for ARM
> subarchitectures.

Yes, that's exactly how I've tried to make it.

>  The patch series to add RISC-V support could look something like this:
> 
> riscv: add RISC-V architecture
>  -> adds it to arch/Config.in and arch/Config.in.riscv
>     For now, selects BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT.
>     Selects the proper atomic etc. toolchain options
> 
> toolchain-buildroot: support riscv
>  -> everything needed to be able to build an internal toolchain with glibc

Both patches are submitted minutes ago to the mailinglist.

> uclibc: support riscv
> 
> linux: support riscv
> 
> configs/qemu_riscv_some_defconfig: new defconfig
> 
> support/config-fragments/autobuild: add RISC-V fragment

These things are still to be done.

>  Even if you don't do all of this, it is useful if you post some of these
> patches, so someone else can take it over.

Thanks again.

>  Regards,
>  Arnout
> 
