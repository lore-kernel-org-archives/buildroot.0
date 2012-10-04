From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 4 Oct 2012 18:09:48 -0400
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <20121004223334.64e74a6f@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <20121004223334.64e74a6f@skate>
Message-ID: <CA+-urNSi+VTS93wP5cEFuLwZn7SCKawpDp6XR6OLqumofBXJyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 4, 2012 at 4:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Fran?ois,
>
> Thanks for keeping up the good work on this.
>
> On Tue, 25 Sep 2012 19:18:17 +0200, Francois Perrad wrote:
>> only user mode for the current target architecture
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in.host      |    1 +
>>  package/qemu/Config.in.host |   15 +++++++++++++++
>>  package/qemu/qemu.mk        |   43 +++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 59 insertions(+)
>>  create mode 100644 package/qemu/Config.in.host
>>  create mode 100644 package/qemu/qemu.mk
>>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index 79050f2..bf95a10 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -4,6 +4,7 @@ source "package/dfu-util/Config.in.host"
>>  source "package/lpc3250loader/Config.in.host"
>>  source "package/omap-u-boot-utils/Config.in.host"
>>  source "package/openocd/Config.in.host"
>> +source "package/qemu/Config.in.host"
>>  source "package/sam-ba/Config.in.host"
>>  source "package/uboot-tools/Config.in.host"
>>
>> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
>> new file mode 100644
>> index 0000000..379507c
>> --- /dev/null
>> +++ b/package/qemu/Config.in.host
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_HOST_QEMU
>> +     bool "host qemu"
>> +     help
>> +       QEMU is a generic and open source machine emulator and virtualizer.
>> +
>> +       In user mode emulation, QEMU runs single cross-compiled programs.
>> +       Fast cross-compilation and cross-debugging are the main targets
>> +       for user-mode emulation.
>> +
>> +       In system mode emulation, QEMU emulates a full computer system,
>> +       including peripherals, and handles the filesystem image generated
>> +       by Buildroot.
>> +       (Buildroot is shipped with many configs/qemu_*_defconfig files).
>> +
>> +       http://qemu.org/
>
> I think you should not add a Kconfig option for the host-qemu package
> for now. Until it supports the system emulation, it is kind of useless
> to have it listed in the host tools. For the perl stuff, you only need
> the user emulation, so let's add support for the user emulation only at
> the moment.

Forgive me if I'm misunderstanding, but I think that listing qemu in
Kconfig may be desirable to me even if only user emulation is
supported. I currently run a set of regression tests as a post-build
step. I use qemu user emulation mode for this. Right now, I use a
system-installed version of qemu-arm but would prefer to use a
buildroot version.

I'm glad to see these patches come in. Thanks for adding them.

Frank
