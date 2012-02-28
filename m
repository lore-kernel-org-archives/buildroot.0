From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Tue, 28 Feb 2012 13:29:55 +0100
Subject: [Buildroot]  Kernel panic with 2012.02 RC1
Message-ID: <CABMxt4gpiwBspv7nF6edRAYT85XcOH9B=CFD8Bn_6JfBNBzeGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After compiling a new compilation with Buildroot and with kernel 2.6.39.4,
i have a strange problem in booting the kernel. could you help me please ?
the booting log is :

reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

2356044 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.39.4
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2355980 Bytes = 2.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
d in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c000fbb8>]
(omap_hwmod_setup_all+0x60/0x98)
[<c000fbb8>] (omap_hwmod_setup_all+0x60/0x98) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed1c ]---
omap_hwmod: i2c1: softreset failed (waited 10000 usec)
omap_hwmod: i2c2: softreset failed (waited 10000 usec)
omap_hwmod: i2c3: softreset failed (waited 10000 usec)
print_constraints: dummy:
NET: Registered protocol family 16
GPMC revision 5.0
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio1: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed1d ]---
omap_device: omap_gpio.0: new worst case activate latency 0: 1037597
OMAP GPIO hardware version 2.5
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio2: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed1e ]---
OMAP GPIO hardware version 2.5
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio3: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed1f ]---
OMAP GPIO hardware version 2.5
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio4: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed20 ]---
OMAP GPIO hardware version 2.5
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio5: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed21 ]---
omap_device: omap_gpio.4: new worst case activate latency 0: 1098632
OMAP GPIO hardware version 2.5
------------[ cut here ]------------
WARNING: at arch/arm/mach-omap2/omap_hwmod.c:1231 _enable+0x38/0x170()
omap_hwmod: gpio6: enabled state can only be entered from initialized,
idle, or disabled state
Modules linked in:
[<c0043a80>] (unwind_backtrace+0x0/0xf0) from [<c005ef30>]
(warn_slowpath_common+0x4c/0x64)
[<c005ef30>] (warn_slowpath_common+0x4c/0x64) from [<c005efc8>]
(warn_slowpath_fmt+0x2c/0x3c)
[<c005efc8>] (warn_slowpath_fmt+0x2c/0x3c) from [<c004ad40>]
(_enable+0x38/0x170)
[<c004ad40>] (_enable+0x38/0x170) from [<c004ae94>]
(omap_hwmod_enable+0x1c/0x34)
[<c004ae94>] (omap_hwmod_enable+0x1c/0x34) from [<c0056054>]
(omap_device_enable_hwmods+0x20/0x34)
[<c0056054>] (omap_device_enable_hwmods+0x20/0x34) from [<c0056244>]
(_omap_device_activate+0x54/0x148)
[<c0056244>] (_omap_device_activate+0x54/0x148) from [<c005643c>]
(omap_device_enable+0x58/0x84)
[<c005643c>] (omap_device_enable+0x58/0x84) from [<c004ca68>]
(omap_pm_runtime_resume+0x20/0x48)
[<c004ca68>] (omap_pm_runtime_resume+0x20/0x48) from [<c01e9388>]
(rpm_callback+0x38/0x44)
[<c01e9388>] (rpm_callback+0x38/0x44) from [<c01ea168>]
(rpm_resume+0x304/0x474)
[<c01ea168>] (rpm_resume+0x304/0x474) from [<c01ea4f0>]
(__pm_runtime_resume+0x30/0x48)
[<c01ea4f0>] (__pm_runtime_resume+0x30/0x48) from [<c031da4c>]
(omap_gpio_probe+0x14c/0x2dc)
[<c031da4c>] (omap_gpio_probe+0x14c/0x2dc) from [<c01e4d34>]
(platform_drv_probe+0x18/0x1c)
[<c01e4d34>] (platform_drv_probe+0x18/0x1c) from [<c01e3b70>]
(driver_probe_device+0xc8/0x184)
[<c01e3b70>] (driver_probe_device+0xc8/0x184) from [<c01e3c8c>]
(__driver_attach+0x60/0x84)
[<c01e3c8c>] (__driver_attach+0x60/0x84) from [<c01e33c8>]
(bus_for_each_dev+0x48/0x84)
[<c01e33c8>] (bus_for_each_dev+0x48/0x84) from [<c01e2d1c>]
(bus_add_driver+0x9c/0x20c)
[<c01e2d1c>] (bus_add_driver+0x9c/0x20c) from [<c01e4288>]
(driver_register+0xac/0x138)
[<c01e4288>] (driver_register+0xac/0x138) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
---[ end trace 1b75b31a2719ed22 ]---
OMAP GPIO hardware version 2.5
omap_mux_init: Add partition: #1: core, flags: 0
omap_device: omap_uart.0: new worst case activate latency 0: 30517
OMAP DMA hardware revision 4.0
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource 32k_counter
Switched to NOHz mode on CPU #0
musb-hdrc: version 6.0, tusb-omap-dma, otg (peripheral+host), debug=0
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NetWinder Floating Point Emulator V0.97 (double precision)
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
JFFS2 version 2.2. (NAND) ? 2001-2006 Red Hat, Inc.
msgmni has been set to 490
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
omap_uart.0: ttyO0 at MMIO 0x4806a000 (irq = 72) is a OMAP UART0
omap_uart.1: ttyO1 at MMIO 0x4806c000 (irq = 73) is a OMAP UART1
omap_uart.2: ttyO2 at MMIO 0x49020000 (irq = 74) is a OMAP UART2
console [ttyO2] enabled
brd: module loaded
loop: module loaded
omap2-nand driver initializing
vcan: Virtual CAN interface driver
CAN device driver interface
TI High End CAN Controller Driver 0.7
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver dm9601
cdc_ncm: 23-Apr-2011
usbcore: registered new interface driver cdc_ncm
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 1
ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: OMAP-EHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.39.4 ehci_hcd
usb usb1: SerialNumber: ehci-omap.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbtest
lirc_dev: IR Remote Control driver registered, major 252
IR NEC protocol handler initialized
IR RC5(x) protocol handler initialized
IR RC6 protocol handler initialized
IR JVC protocol handler initialized
IR Sony protocol handler initialized
IR RC5 (streamzap) protocol handler initialized
IR LIRC bridge handler initialized
Linux video capture interface: v2.00
omap_device: omap_wdt.-1: new worst case activate latency 0: 30517
OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
NET: Registered protocol family 15
can: controller area network core (rev 20090105 abi 8)
NET: Registered protocol family 29
can: raw protocol (rev 20090105)
can: broadcast manager protocol (rev 20090105 t)
Registering the dns_resolver key type
VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 1
Unable to handle kernel NULL pointer dereference at virtual address 0000002a
pgd = c0004000
[0000002a] *pgd=00000000
Internal error: Oops: 5 [#1]
last sysfs file:
Modules linked in:
CPU: 0    Tainted: G        W    (2.6.39.4 #1)
PC is at twl_i2c_read+0x38/0x11c
LR is at omap3_twl_set_sr_bit+0x34/0x9c
pc : [<c01edd94>]    lr : [<c000ff80>]    psr: 00000013
sp : cf41df50  ip : 22222222  fp : 00000001
r10: 00000000  r9 : 0000002a  r8 : 00000000
r7 : 00000000  r6 : 00000001  r5 : c0491b08  r4 : c0482318
r3 : 00000000  r2 : 00000006  r1 : cf41df8f  r0 : 00000015
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 80004019  DAC: 00000015
Process swapper (pid: 1, stack limit = 0xcf41c2e8)
Stack: (0xcf41df50 to 0xcf41e000)
df40:                                     cf41df8f 00000006 c0446248
c0446250
df60: cf4203c0 c0482318 00000001 c003fbd0 00000000 00000000 00000000
00000000
df80: 00000000 c000ff80 00000001 0000f472 00000000 c0482318 c000f664
c0010034
dfa0: c0482318 c000f670 c0028a58 c00343a0 c0032fd8 00003539 00000000
c0030000
dfc0: 00000013 c0028a58 c0028a9c c003fbd0 00000013 00000000 00000000
00000000
dfe0: 00000000 c0008550 00000000 c00084c0 c003fbd0 c003fbd0 3b7fcee6
f6b9b1b9
[<c01edd94>] (twl_i2c_read+0x38/0x11c) from [<c000ff80>]
(omap3_twl_set_sr_bit+0x34/0x9c)
[<c000ff80>] (omap3_twl_set_sr_bit+0x34/0x9c) from [<c0010034>]
(omap3_twl_init+0x4c/0x88)
[<c0010034>] (omap3_twl_init+0x4c/0x88) from [<c000f670>]
(omap2_common_pm_late_init+0xc/0x50)
[<c000f670>] (omap2_common_pm_late_init+0xc/0x50) from [<c00343a0>]
(do_one_initcall+0x94/0x164)
[<c00343a0>] (do_one_initcall+0x94/0x164) from [<c0008550>]
(kernel_init+0x90/0x13c)
[<c0008550>] (kernel_init+0x90/0x13c) from [<c003fbd0>]
(kernel_thread_exit+0x0/0x8)
Code: e1a09080 e5d56008 e5953004 e2366001 (e7d32080)
---[ end trace 1b75b31a2719ed23 ]---
Kernel panic - not syncing: Attempted to kill init!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120228/554f6404/attachment-0001.html>
