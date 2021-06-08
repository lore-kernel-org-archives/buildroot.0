From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 8 Jun 2021 22:55:47 +0200
Subject: [Buildroot] BL2: Failed to load image (-80)
In-Reply-To: <YL/KmfuuLHgmtIE+@curiosity>
References: <CAOiXNkDSm5hf=WH5ECrVN_DkYk4KCwG46_0L6iWbpbXAW4wRig@mail.gmail.com>
 <YL/KmfuuLHgmtIE+@curiosity>
Message-ID: <CAOiXNkCykbPW8qkEhx_9VyoQnBRd=mxofDD4EX4c-o66XFCgpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, thank you very much for the hint!

> Some time ago I investigated a similar issue for stm32mp157c-dk2 board.
> In my case error code was different, but behavior was similar to yours.
> RFC patch and root cause analysis is available in buildroot patchwork:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20210130204456.793098-1-geomatsi at gmail.com/

So the suggested solution is to:
* create a separate 16K env partition by modifying genimage.cfg.template
* tell u-boot to use this partition by patching stm32mp157a-dk1-u-boot.dtsi
  with u-boot,mmc-env-partition = "env";
* modifying extlinux.conf by setting root=/dev/mmcblk0p5

Is my understanding correct?

Regards,
Andrey.
