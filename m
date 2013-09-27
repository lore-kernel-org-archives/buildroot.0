From: Jason Kridner <jkridner@beagleboard.org>
Date: Fri, 27 Sep 2013 10:24:50 -0400
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <1380284469.22318.31.camel@viko>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <1380284469.22318.31.camel@viko>
Message-ID: <CA+T6QP=hofgj0D+L2SPBO3UMs7Fe3CeqEwJfAxMynkncGPH0tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 27, 2013 at 8:21 AM, Fatih A??c? <fatih.asici@gmail.com> wrote:
> On Thu, 2013-09-26 at 18:40 +0000, Jason Kridner wrote:
>> From: Jason Kridner <jdk@ti.com>
>>
>> Signed-off-by: Jason Kridner <jdk@ti.com>
>> ---
>>  board/beagleboneblack/linux-3.8.config | 4305 ++++++++++++++++++++++++++++++++
>>  configs/beagleboneblack_defconfig      |   38 +
>>  2 files changed, 4343 insertions(+)
>>  create mode 100644 board/beagleboneblack/linux-3.8.config
>>  create mode 100644 configs/beagleboneblack_defconfig
>>
>
> Tested this with Beaglebone Black. u-boot loads kernel image
> from /boot/uImage by default (see include/configs/am335x_evm.h) so that
> BR2_LINUX_KERNEL_INSTALL_TARGET is needed to be able to boot.
>
> I see these errors at startup:
>
> /etc/init.d/S93-am335x-pm-firmware-load: line 4: can't
> create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading: nonexistent directory
> /etc/init.d/S93-am335x-pm-firmware-load: line 5: can't
> create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data: nonexistent directory
> /etc/init.d/S93-am335x-pm-firmware-load: line 6: can't
> create /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading: nonexistent directory

First, there is an error in hardcoding the index. The script needs to
be edited to say "ocp.*", since the index can change.

Second, I'm missing something in my kernel defconfig for this wkup_m3
to show up. I'll try to fix it in a second rev because right now I
have a kernel/config I know works well.  I'll drop this package from
my initial commit.

>
>
> I have also tried my chance to boot "am335x evm starter kit" by adding
> am335x-evmsk to the dts list; but it didn't boot :/
>
> Thanks,
> Fatih
>
>
