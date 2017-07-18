From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 18 Jul 2017 10:33:18 +0200
Subject: [Buildroot] [RFC] kernel-module-imx-gpu-viv:compaling error
In-Reply-To: <20170718100720.39028066@windsurf>
References: <1500358371269-171162.post@n4.nabble.com>
 <20170718100720.39028066@windsurf>
Message-ID: <CAAMH-ysnm5JMQnAJ4jQJS700o1tDE6tKeW0-niz8eBdRRQXWSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Refik,

On Tue, Jul 18, 2017 at 10:07 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 17 Jul 2017 23:12:51 -0700 (PDT), Refik Tuzakl? wrote:
>
>> [/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.o]
>> Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: ***
>> [_module_/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src]
>> Error 2
>> make[1]: Leaving directory
>> `/home/bsm/Desktop/buildroot/output/build/linux-4.11.9'
>> make: ***
>> [/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/.stamp_built]
>> Error 2
>
> Please indicate the Buildroot version being used, and provide the
> Buildroot .config file that allows to reproduce this issue.
>
> But I believe the answer is pretty simple: you're trying to build the
> i.MX GPU Vivante kernel module against Linux 4.11, and the i.MX GPU
> Vivante kernel module hasn't been modified to work with such a recent
> Linux kernel.
>
> I believe the i.MX GPU Vivante kernel module is most likely designed to
> work with the Linux 4.1 based BSP provided by Freescale/NXP.

Thomas is correct, this GPU module is only meant for NXP-based kernels
from 3.10.x to 4.1.x.

For mainline GPU support, please use the Etnaviv module which is part
of the mainline kernel.

Regards,
Gary
