From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 13 Jul 2018 16:51:01 +0200
Subject: [Buildroot] RISC-V support
In-Reply-To: <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
References: <0fb21945-492b-520b-e859-b827429312bd@aries-embedded.de>
 <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
Message-ID: <79a73931-16b0-7d5d-d514-be1baa16557b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anton, Arnout,

Le 13/07/2018 ? 11:10, Arnout Vandecappelle a ?crit?:
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

Indeed, patches are welcome :)

> 
> 
>> As a starting point, I have made minimal additions resulting in
>> a successful build of the buildroot toolchain and sdk.
> 
>  Excellent!
> 
>  How about a kernel?
> 
>> At the moment 64-bit only, gcc-7.3.0, glibc-2.27-57 -- from upstream.
> 
>  64-bit only seems a small constraint, IIUC the 32 and 64 bit variants are
> nearly identical, no?
> 
>  Constraints on minimal versions of the toolchain components are expected. We
> even have BR2_ARCH_NEEDS_GCC_AT_LEAST_7 to handle that. It's used a lot for ARM
> subarchitectures.
> 
> 
>  The patch series to add RISC-V support could look something like this:
> 
> riscv: add RISC-V architecture
>  -> adds it to arch/Config.in and arch/Config.in.riscv
>     For now, selects BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT.
>     Selects the proper atomic etc. toolchain options
> 
> toolchain-buildroot: support riscv
>  -> everything needed to be able to build an internal toolchain with glibc
> 
> uclibc: support riscv

musl (if supported)

> 
> linux: support riscv
> 
> configs/qemu_riscv_some_defconfig: new defconfig
> 
> support/config-fragments/autobuild: add RISC-V fragment
> 
> 
>  Even if you don't do all of this, it is useful if you post some of these
> patches, so someone else can take it over.

After this work, we will need some help to fix all issues discovered by this new
architecture/toolchain.

It would be great to have someone able to test on a real hardware, at least we
can test on Qemu (best effort).

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
