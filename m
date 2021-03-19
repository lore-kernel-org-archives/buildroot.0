From: D. Olsson <hi@senzilla.io>
Date: Fri, 19 Mar 2021 08:51:27 +0000
Subject: [Buildroot] [PATCH v4 09/10]
 configs/solidrun_macchiatobin_efi_defconfig: EFI config for MacchiatoBin
In-Reply-To: <875z1nhhut.fsf@tarshish>
References: <BR9BhREuAfwfd9s4mqI0EWezwoEfLpNZ5ISfiQPgxQ@cp4-web-040.plabs.ch>
 <875z1nhhut.fsf@tarshish>
Message-ID: <-BVjHRbFWyIo1arK7Y24o3WaZdGu5VW6v9Q1xn1NlpFpWn3PJgqLIo1qdjbzNzr_ZCL0Jk45U3U1T43AxhKac1Ce_eOfaLn3cGJgqSqiF-E=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for catching that! I have another small iteration coming in the next days so I will fix this at the same time.

D. Olsson
PGP: 8204A8CD

On Fri, Mar 19, 2021 at 05:45, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Dick,
>
> On Thu, Mar 18 2021, Dick Olsson via buildroot wrote:
>> This introduces an alternative board build for the MacchiatoBin based on
>> EDK2 (UEFI) firmware loaded as BL33 by ARM Trusted Firmware.
>>
>> Signed-off-by: Dick Olsson <hi@senzilla.io>
>>
>> ---
>>
>> Revision 4:
>>
>> * Renamed post-image.sh to assemble-flash-images
>> * Updated to Linux LTS kernel 5.10
>> * Added startup.nsh for auto-booting from the EFI shell
>
> [...]
>
>> diff --git a/board/solidrun/macchiatobin-efi/readme.txt b/board/solidrun/macchiatobin-efi/readme.txt
>> new file mode 100644
>> index 0000000000..b9794dd3d4
>> --- /dev/null
>> +++ b/board/solidrun/macchiatobin-efi/readme.txt
>> @@ -0,0 +1,90 @@
>> +Intro
>> +=====
>> +
>> +This is the board support for MacchiatoBin with a more modern firmware stack
>> +compared to the original build with board/solidrun/macchiatobin.
>> +
>> +The goal with this default configuration is to provide a build as close to
>> +ARM Server Base Boot Requirement (SBBR) as possible. This gives us the
>> +following benefits:
>> +
>> + - The firmware is built and flashed separately from the OS image
>> + - Therefore, the board will boot with any standard Aarch64 distribution image
>> + - UEFI provides a more standardized firmware interface
>> +
>> +How to build
>> +============
>> +
>> +The default configuration provides the following stack:
>> +
>> + - ARM Trusted Firmware (mainline)
>> + - EDK2 UEFI firmware (mainline)
>> + - Linux 5.9 (mainline)
>
> Should be 5.10.
>
> baruch
>
>> +
>> + $ make solidrun_macchiatobin_efi_defconfig
>> + $ make
>> +
>> +The next step will depend on whether you have U-Boot or UEFI flashed on the
>> +board.
>
> --
> ~. .~ Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
> - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210319/682e2da2/attachment.html>
