From: D. Olsson <hi@senzilla.io>
Date: Fri, 31 Jul 2020 11:41:16 +0000
Subject: [Buildroot] [PATCH v2 0/6] Introduce EDK2 firmware builds
In-Reply-To: <CAK4VdL3+oYewY2t4BOT3mHOPsr+JotOgR3q4p8jhQW4X-CZkaA@mail.gmail.com>
References: <20200726100541.7710-1-hi@senzilla.io>
 <CAK4VdL3+oYewY2t4BOT3mHOPsr+JotOgR3q4p8jhQW4X-CZkaA@mail.gmail.com>
Message-ID: <_pFWXtI6uMrvpRqU-FWkN6XLGSgbtirTpEhUcw9tUGYT9JXkgCsH3jN0Bc_930uaPFl--KMd5vRxgc-f5PD8sTkvgBLmYGQmRrCN9LqarjU=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

On Monday, 27 July 2020 16:57, Erico Nunes <nunes.erico@gmail.com> wrote:

> I tried to build edk2 with the defconfig changes on the aarch64_efi
> and pc efi defconfigs, but it failed to build some host tool with:
>
> gcc -c -I .. -I ../Include/Common -I ../Include/ -I
> ../Include/IndustryStandard -I ../Common/ -I .. -I . -I
> ../Include/X64/ -MD -fshort-wchar -fno-strict-aliasing -fwrapv
> -fno-delete-null-pointer-checks -Wall -Werror
> -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict
> -Wno-unused-result -nostdlib -g -O2 GenFv.c -o GenFv.o
> gcc -c -I .. -I ../Include/Common -I ../Include/ -I
> ../Include/IndustryStandard -I ../Common/ -I .. -I . -I
> ../Include/X64/ -MD -fshort-wchar -fno-strict-aliasing -fwrapv
> -fno-delete-null-pointer-checks -Wall -Werror
> -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict
> -Wno-unused-result -nostdlib -g -O2 GenFvInternalLib.c -o
> GenFvInternalLib.o
> GenFvInternalLib.c:19:10: fatal error: uuid/uuid.h: No such file or directory
> 19 | #include <uuid/uuid.h>

Thanks for catching this! I was able to reproduce this issue when building
on a newly provisioned host. Not sure why I've been missing this before!

> Looks like libuuid comes from util-linux and host-util-linux was even
> built in Buildroot with libuuid enabled.
> So apparently the edk2 host build is missing the flags from Buildroot
> to build host tools?
>
> Then I noticed that edk2 doesn't have a host package while some host
> tools are built. Maybe it's not absolutely required if it adds too
> much complexity, but is this intentional?

This wasn't an intentional design decision. I'll look into how to best
solve this.


Thanks!

D. Olsson
PGP: 8204A8CD
