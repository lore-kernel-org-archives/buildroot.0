From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sat, 31 May 2014 08:42:28 -0700
Subject: [Buildroot] new TI  kernel version for beaglebone black
In-Reply-To: <5389CDB9.3080209@gmail.com>
References: <5388F5A2.1080008@ethertek.ca> <5389CDB9.3080209@gmail.com>
Message-ID: <5389F864.80909@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/31/2014 5:40 AM, Hadrien Boutteville wrote:
> Hello Dan,
>
> On Fri, 30 May 2014 14:18:26 -0700, Dan Pattison wrote:
>> I have a question that is probably not 100% buildroot related, but was
>> hoping to get some help. I am using buildroot to build a kernel and
>> rootFS for a beaglebone black. Buildroot is awesome and builds
>> everything fine. The board boots up and all packages work properly.
>> Unfortunately, USB seems to be badly broken. In the kernel I have USB
>> driver enabled and USB Announce New Devices turned on. Googling around I
>> find several people with the same problem, hotplug does not work at all,
>> and no device I have tried shows up in dmesg or lsusb on cold or warm
>> boot. A band aid is to use a powered USB hub (have not tried that). Some
>> guys on the beagleboard.org IRC say to try a newer kernel version (3.14
>> or >) because beaglebone USB is fixed in newer kernel versions. Current
>> buildroot beaglebone black kernel version is 3.12.10
>>
>> In buildroot I used make beaglebone_defconfig.
>> Under the Kernel menu, Custom Git repository is selected.
>> The git URL is https://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>> The custom repository version is 7f280334068b7c875ade51f8f3921ab311f0c824
>> The def config is board/beaglebone/linux-3.12.config
> I'm using the default beaglebone_defconfig on BBB and USB hotplug works
> fine. In the default kernel config the options are selected as modules,
> so you have to load them:
>
>    $ modprobe musb_am335x
>    $ modprobe musb_dsps
>
> After that, outputs in dmesg will tell you that the USB port is found
> (short version) and USB hotplug will work (I just tested).
>
>> How was the custom repository number
>> (7f280334068b7c875ade51f8f3921ab311f0c824) derived? Looking on the TI
>> gitorious site, I see they are working on kernel 3.15. How can I make
>> buildroot use the newer version? How do I find the newer custom
>> repository version? I tried to find my answer with google, but I must
>> not be using the correct search term. Please excuse the newbish questions.
> Regards,
>
> Hadrien
>
Hello Hadrien,

Thanks for the help. I had the drivers compiled into he kernel not as 
modules. When I reverted my changes back to module and added depmod to 
busybox, then things started to happen. Again, thanks for the help.

Best Regards,

Dan Pattison
Ethertek Circuits
