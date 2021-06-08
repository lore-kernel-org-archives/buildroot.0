From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 8 Jun 2021 22:52:57 +0300
Subject: [Buildroot] BL2: Failed to load image (-80)
In-Reply-To: <CAOiXNkDSm5hf=WH5ECrVN_DkYk4KCwG46_0L6iWbpbXAW4wRig@mail.gmail.com>
References: <CAOiXNkDSm5hf=WH5ECrVN_DkYk4KCwG46_0L6iWbpbXAW4wRig@mail.gmail.com>
Message-ID: <YL/KmfuuLHgmtIE+@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Andrey,

> I am currently trying to add support for L-876e.A1 STM32MP1 board from Phytec.
> 
> https://www.phytec.de/en/produkte/single-board-computer/phyboard-sargas-stm32mp1/
> https://www.phytec.de/cdocuments/?doc=d4PmEQ
> 
> My approach is to transfer parts (patches&Co.) from the provided Yocto
> BSP and package them as required by Buildroot.
> 
> I reach the point where the boot process completes successfully and I
> can log in to the shell. However, it works only once after flashing
> the SD card. All the subsequent boots yield the error:
> BL2: Failed to load image (-80)
> and the boot process stopped there.

...

> But maybe there are other possible reasons. I would be thankful for
> any hints on how I can find the reasons for this one-time-only boot
> problem. Of course, when it works I will contribute it back to
> Buildroot.

Some time ago I investigated a similar issue for stm32mp157c-dk2 board.
In my case error code was different, but behavior was similar to yours.
RFC patch and root cause analysis is available in buildroot patchwork:

https://patchwork.ozlabs.org/project/buildroot/patch/20210130204456.793098-1-geomatsi at gmail.com/

Regards,
Sergey
