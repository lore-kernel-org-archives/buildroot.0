From: =?utf-8?Q?Jean-Fran=C3=A7ois_T=C3=AAtu?= <jean-francois.tetu@savoirfairelinux.com>
Date: Fri, 13 Jul 2018 11:17:45 -0400 (EDT)
Subject: [Buildroot] RISC-V support
In-Reply-To: <79a73931-16b0-7d5d-d514-be1baa16557b@smile.fr>
References: <0fb21945-492b-520b-e859-b827429312bd@aries-embedded.de>
 <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
 <79a73931-16b0-7d5d-d514-be1baa16557b@smile.fr>
Message-ID: <956588355.10580343.1531495065163.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Friday, July 13, 2018 10:51:01 AM, Romain Naour wrote:
> Hi Anton, Arnout,
> 
> Le 13/07/2018 ? 11:10, Arnout Vandecappelle a ?crit?:
>> 
>> 
>> On 13-07-18 10:34, Anton Kuzmin wrote:
>>> Hello All,
>>>
>>> Is anybody already working on adding of the RISC-V [1] support
>>> to buildroot?  If yes, is there any place to discuss/share the progress?
>>> If not, are there any reasons not to do it?
>> 
>>  There is definitely no reason not to add support for it RISC-V.
> 
> Indeed, patches are welcome :)
>

Great! Just this week I planned on starting a simple build targeting the
'virt' machine [1]. I noted the upstream versions [2] of the needed tools,
like binutils, gcc, and glibc. We could also help out Michael Clark in 
adding RISC-V support in upstream musl [3].

>> 
>> 
>>> As a starting point, I have made minimal additions resulting in
>>> a successful build of the buildroot toolchain and sdk.
>> 
>>  Excellent!
>> 
>>  How about a kernel?
>> 
>>> At the moment 64-bit only, gcc-7.3.0, glibc-2.27-57 -- from upstream.
>> 
>>  64-bit only seems a small constraint, IIUC the 32 and 64 bit variants are
>> nearly identical, no?
>> 
>>  Constraints on minimal versions of the toolchain components are expected. We
>> even have BR2_ARCH_NEEDS_GCC_AT_LEAST_7 to handle that. It's used a lot for ARM
>> subarchitectures.
>> 
>> 
>>  The patch series to add RISC-V support could look something like this:
>> 
>> riscv: add RISC-V architecture
>>  -> adds it to arch/Config.in and arch/Config.in.riscv
>>     For now, selects BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT.
>>     Selects the proper atomic etc. toolchain options
>> 
>> toolchain-buildroot: support riscv
>>  -> everything needed to be able to build an internal toolchain with glibc
>> 
>> uclibc: support riscv
> 
> musl (if supported)
> 
>> 
>> linux: support riscv
>> 
>> configs/qemu_riscv_some_defconfig: new defconfig
>> 
>> support/config-fragments/autobuild: add RISC-V fragment
>> 
>> 
>>  Even if you don't do all of this, it is useful if you post some of these
>> patches, so someone else can take it over.
> 
> After this work, we will need some help to fix all issues discovered by this new
> architecture/toolchain.
> 
> It would be great to have someone able to test on a real hardware, at least we
> can test on Qemu (best effort).
> 
> Best regards,
> Romain
>

If you want, I would like to help you out with those patches :). Having
a basic toolchain is already an important step. However, I do not have 
access to RISC-V hardware.

>> 
>>  Regards,
>>  Arnout
>> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://github.com/riscv/riscv-qemu/wiki#machines
[2] https://riscv.org/software-status/
[3] https://github.com/rv8-io/musl-riscv-toolchain

Regards,

--
Jean-Fran?ois T?tu
