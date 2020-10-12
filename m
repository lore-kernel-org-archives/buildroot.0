From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 12 Oct 2020 16:49:01 +0200
Subject: [Buildroot] [PATCH v3 4/4] configs/stm32mp157c-dk2: add support
 for wifi
In-Reply-To: <CALxJ29Q-VLWxueFYQftzp039W7aWuVroCq38Bf4fpgERysxdRA@mail.gmail.com>
References: <20201007144945.1697081-1-shlomi.39sd@gmail.com>
 <20201007144945.1697081-4-shlomi.39sd@gmail.com>
 <15798cdd-e335-a291-53d4-1ac03d1bbd6c@grinn-global.com>
 <e9f06c52-191f-887b-2d8e-4d76acb277d0@grinn-global.com>
 <CALxJ29RjdYFrkX9B+dQ8xi7LhGaCCVXRVWz-b6+hQw_oy1Qidg@mail.gmail.com>
 <21173a82-a49b-f89f-8530-2f86656bc285@grinn-global.com>
 <CALxJ29SkXuxpJmNyCO61aF_ur+fL_4tQ-NFiZuDEg8aZSOA9og@mail.gmail.com>
 <efe16945-0124-b38a-0546-c135755d3cce@grinn-global.com>
 <CALxJ29QfbGjQwELFeaKdBhdPbFRjyB=31S3oU8uU1KzCnsYFvw@mail.gmail.com>
 <181128db-472e-a47c-74ac-9a01d18665da@grinn-global.com>
 <a9862af8-920a-538d-ca98-a745fc218bee@grinn-global.com>
 <CALxJ29Q-VLWxueFYQftzp039W7aWuVroCq38Bf4fpgERysxdRA@mail.gmail.com>
Message-ID: <6c93dea7-775a-ab37-fe7a-52303022f8c6@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Shlomi,

On 10.10.2020 22:48, Shlomi Vaknin wrote:
> Hi Bartek,
>
> I did as you said and it didn't work. Here are the steps I did:
>
> 1. I changed as you said - didn't work.
> 2. I flashed the original image from st - works.
> 3. I flashed again the buildroot image - works.
> 4. I did hard reset - not working.
>
> Can you verify that you have this experience?

Let's put this topic off for now because it blocks the rest of the 
patches that look good and can be merged. I need more time to check what 
exactly is going on with this wlan module.

Best
Bartek
>
> ??????? ???, 10 ????? 2020 ?-22:01 ??? ?Bartosz Bilas?? 
> <?b.bilas at grinn-global.com <mailto:b.bilas@grinn-global.com>??>:?
>
>     Hi Shlomi,
>
>     On 10.10.2020 17:41, Bartosz Bilas wrote:
>>
>>     Hello Shlomi,
>>
>>     On 09.10.2020 21:13, Shlomi Vaknin wrote:
>>>     HI!
>>>
>>>     According to u-boot I have the same revision as you. Could you
>>>     try the formal version from st:
>>>     https://www.st.com/en/embedded-software/stm32mp1starter.html ? I
>>>     flashed it and the wifi worked. Just to be sure that there is no
>>>     issue or something else with your board.
>>>
>>>     Best
>>>     Shlomi
>>>
>>     I've used:
>>
>>     ST OpenSTLinux - Weston - (A Yocto Project Based Distro)
>>     3.1-openstlinux-5.4-dunfell-mp1-20-06-24 stm32mp1 ttySTM0
>>
>>     and everything seems to be ok
>>
>>     root at stm32mp1:~# ifconfig -a
>>     eth0????? Link encap:Ethernet? HWaddr 00:80:E1:42:56:44
>>     ????????? UP BROADCAST MULTICAST? MTU:1500? Metric:1
>>     ????????? RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>     ????????? TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>     ????????? collisions:0 txqueuelen:1000
>>     ????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>     ????????? Interrupt:48 Base address:0x4000
>>
>>     lo??????? Link encap:Local Loopback
>>     ????????? inet addr:127.0.0.1? Mask:255.0.0.0
>>     ????????? inet6 addr: ::1/128 Scope:Host
>>     ????????? UP LOOPBACK RUNNING? MTU:65536? Metric:1
>>     ????????? RX packets:80 errors:0 dropped:0 overruns:0 frame:0
>>     ????????? TX packets:80 errors:0 dropped:0 overruns:0 carrier:0
>>     ????????? collisions:0 txqueuelen:1000
>>     ????????? RX bytes:6080 (5.9 KiB)? TX bytes:6080 (5.9 KiB)
>>
>>     usb0????? Link encap:Ethernet? HWaddr 4E:12:37:C3:7B:6C
>>     ????????? UP BROADCAST MULTICAST? MTU:1500? Metric:1
>>     ????????? RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>     ????????? TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>     ????????? collisions:0 txqueuelen:1000
>>     ????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>
>>     wlan0???? Link encap:Ethernet? HWaddr 10:98:C3:5F:FB:F9
>>     ????????? BROADCAST MULTICAST? MTU:1500? Metric:1
>>     ????????? RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>     ????????? TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>     ????????? collisions:0 txqueuelen:1000
>>     ????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>
>>     I'm gonna double-check one more time what's wrong with
>>     buildroot's image though.
>>
>>     Best
>>     Bartek
>
>     I've got this working fine, I had to add
>     BR2_PACKAGE_MURATA_CYW_FW_CYW43430 instead of
>     BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX as I mentioned before, I
>     also added BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
>
>     and I've successfully connected with my wifi network.
>
>     # ifconfig
>     lo??????? Link encap:Local Loopback
>     ????????? inet addr:127.0.0.1? Mask:255.0.0.0
>     ????????? inet6 addr: ::1/128 Scope:Host
>     ????????? UP LOOPBACK RUNNING? MTU:65536? Metric:1
>     ????????? RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>     ????????? TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>     ????????? collisions:0 txqueuelen:1000
>     ????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>
>     wlan0???? Link encap:Ethernet? HWaddr 10:98:C3:5F:FB:F9
>     ????????? inet addr:192.168.10.110? Bcast:192.168.10.255
>     Mask:255.255.255.0
>     ????????? inet6 addr: fd3a:e7f5:fc04:0:1298:c3ff:fe5f:fbf9/64
>     Scope:Global
>     ????????? inet6 addr: fe80::1298:c3ff:fe5f:fbf9/64 Scope:Link
>     ????????? UP BROADCAST RUNNING MULTICAST? MTU:1500 Metric:1
>     ????????? RX packets:8 errors:0 dropped:0 overruns:0 frame:0
>     ????????? TX packets:12 errors:0 dropped:0 overruns:0 carrier:0
>     ????????? collisions:0 txqueuelen:1000
>     ????????? RX bytes:1624 (1.5 KiB)? TX bytes:1988 (1.9 KiB)
>
>     # ping google.com <http://google.com>
>     PING google.com <http://google.com> (216.58.215.78): 56 data bytes
>     64 bytes from 216.58.215.78 <http://216.58.215.78>: seq=0 ttl=116
>     time=29.594 ms
>     64 bytes from 216.58.215.78 <http://216.58.215.78>: seq=1 ttl=116
>     time=39.401 ms
>     ^C
>     --- google.com <http://google.com> ping statistics ---
>     2 packets transmitted, 2 packets received, 0% packet loss
>     round-trip min/avg/max = 29.594/34.497/39.401 ms
>
>
>     Could you verify if it works well on your device?
>
>>>     ??????? ??? ??, 9 ????? 2020 ?-19:49 ??? ?Bartosz Bilas??
>>>     <?b.bilas at grinn-global.com <mailto:b.bilas@grinn-global.com>??>:?
>>>
>>>         Hello Shlomi,
>>>
>>>         On 08.10.2020 22:45, Shlomi Vaknin wrote:
>>>>         Hi Bartek,
>>>>
>>>>         I pulled the latest commits, downloaded my patches from
>>>>         patchwork and applied them. Then, I started a new out of
>>>>         tree build and everything is working. You can find my
>>>>         sdcard?image here:
>>>>         https://drive.google.com/drive/folders/1_FwVtw70iPS_hz7yFiiOlhXiUKlsi9bH?usp=sharing
>>>>
>>>>         This problem is very strange. Maybe you can check if your
>>>>         board's wifi is working with an image that is known to
>>>>         work? Maybe the formal image from st?
>>>>
>>>>         Regards,
>>>>         Shlomi
>>>>
>>>         I've tested your image but the result is the same, see:
>>>
>>>         [? 129.691504] cfg80211: Loading compiled-in X.509
>>>         certificates for regulatory database
>>>         [? 129.740878] cfg80211: Loaded X.509 cert 'sforshee:
>>>         00b28ddf47aef9cea7'
>>>         # [? 129.804593] brcmfmac: brcmf_fw_alloc_request: using
>>>         brcm/brcmfmac43430-sdio for chip BCM43430/1
>>>         [? 130.885129] brcmfmac: brcmf_sdio_htclk: HT Avail timeout
>>>         (1000000): clkctl 0x50
>>>         [? 131.911135] brcmfmac: brcmf_sdio_htclk: HT Avail timeout
>>>         (1000000): clkctl 0x50
>>>
>>>         My board is:
>>>
>>>         CPU: STM32MP157CAC Rev.B
>>>         Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
>>>         Board: stm32mp1 in trusted mode (st,stm32mp157c-dk2)
>>>         Board: MB1272 Var2.0 Rev.C-01
>>>         DRAM:? 512 MiB
>>>
>>>         Best
>>>         Bartek
>>>>         ??????? ??? ??, 8 ????? 2020 ?-20:31 ??? ?Bartosz Bilas??
>>>>         <?b.bilas@grinn-global.com
>>>>         <mailto:b.bilas@grinn-global.com>??>:?
>>>>
>>>>             Hi Shlomi,
>>>>
>>>>             On 07.10.2020 22:16, Shlomi Vaknin wrote:
>>>>>             Hi Bartek,
>>>>>
>>>>>             That is very strange, since it works for me:
>>>>>
>>>>>             #############################################################################################################################
>>>>>             Starting mdev... OK
>>>>>             [ ? ?4.168709] cfg80211: Loading compiled-in X.509
>>>>>             certificates for regulatory database
>>>>>             [ ? ?4.224122] cfg80211: Loaded X.509 cert 'sforshee:
>>>>>             00b28ddf47aef9cea7'
>>>>>             [ ? ?4.288641] brcmfmac: brcmf_fw_alloc_request: using
>>>>>             brcm/brcmfmac43430-sdio for chip BCM43430/1
>>>>>             [ ? ?4.486998] brcmfmac: brcmf_fw_alloc_request: using
>>>>>             brcm/brcmfmac43430-sdio for chip BCM43430/1
>>>>>             [ ? ?4.501649] brcmfmac: brcmf_c_process_clm_blob: no
>>>>>             clm_blob available (err=-2), device may have limited
>>>>>             channels available
>>>>>             [ ? ?4.536998] brcmfmac: brcmf_c_preinit_dcmds:
>>>>>             Firmware: BCM43430/1 wl0: Oct 23 2017 03:55:53 version
>>>>>             7.45.98.38 (r674442 CY) FWID 01-e58d219f
>>>>>
>>>>>             # ifconfig -a
>>>>>             eth0 ? ? ?Link encap:Ethernet ?HWaddr 00:80:E1:42:58:DB
>>>>>             ? ? ? ? ? BROADCAST MULTICAST ?MTU:1500 ?Metric:1
>>>>>             ? ? ? ? ? RX packets:0 errors:0 dropped:0 overruns:0
>>>>>             frame:0
>>>>>             ? ? ? ? ? TX packets:0 errors:0 dropped:0 overruns:0
>>>>>             carrier:0
>>>>>             ? ? ? ? ? collisions:0 txqueuelen:1000
>>>>>             ? ? ? ? ? RX bytes:0 (0.0 B) ?TX bytes:0 (0.0 B)
>>>>>             ? ? ? ? ? Interrupt:49 Base address:0xe000
>>>>>
>>>>>             lo ? ? ? ?Link encap:Local Loopback
>>>>>             ? ? ? ? ? inet addr:127.0.0.1 ?Mask:255.0.0.0
>>>>>             ? ? ? ? ? inet6 addr: ::1/128 Scope:Host
>>>>>             ? ? ? ? ? UP LOOPBACK RUNNING ?MTU:65536 ?Metric:1
>>>>>             ? ? ? ? ? RX packets:0 errors:0 dropped:0 overruns:0
>>>>>             frame:0
>>>>>             ? ? ? ? ? TX packets:0 errors:0 dropped:0 overruns:0
>>>>>             carrier:0
>>>>>             ? ? ? ? ? collisions:0 txqueuelen:1000
>>>>>             ? ? ? ? ? RX bytes:0 (0.0 B) ?TX bytes:0 (0.0 B)
>>>>>
>>>>>             sit0 ? ? ?Link encap:IPv6-in-IPv4
>>>>>             ? ? ? ? ? NOARP ?MTU:1480 ?Metric:1
>>>>>             ? ? ? ? ? RX packets:0 errors:0 dropped:0 overruns:0
>>>>>             frame:0
>>>>>             ? ? ? ? ? TX packets:0 errors:0 dropped:0 overruns:0
>>>>>             carrier:0
>>>>>             ? ? ? ? ? collisions:0 txqueuelen:1000
>>>>>             ? ? ? ? ? RX bytes:0 (0.0 B) ?TX bytes:0 (0.0 B)
>>>>>
>>>>>             wlan0 ? ? Link encap:Ethernet ?HWaddr 00:9D:6B:A6:BC:BA
>>>>>             ? ? ? ? ? BROADCAST MULTICAST ?MTU:1500 ?Metric:1
>>>>>             ? ? ? ? ? RX packets:0 errors:0 dropped:0 overruns:0
>>>>>             frame:0
>>>>>             ? ? ? ? ? TX packets:0 errors:0 dropped:0 overruns:0
>>>>>             carrier:0
>>>>>             ? ? ? ? ? collisions:0 txqueuelen:1000
>>>>>             ? ? ? ? ? RX bytes:0 (0.0 B) ?TX bytes:0 (0.0 B)
>>>>>             #############################################################################################################################
>>>>>
>>>>>             The nvram configuration file was directly copied from
>>>>>             the bsp layer of st in yocto (dunfell):
>>>>>             https://github.com/STMicroelectronics/meta-st-stm32mp/blob/dunfell/recipes-kernel/linux-firmware/linux-firmware/brcmfmac43430-sdio.txt
>>>>>
>>>>>             Regards,
>>>>>             Shlomi
>>>>             So in that case we have to clarify our environments.
>>>>             Have you tested using the latest master branch or is it
>>>>             some tagged version? Could you do a clean build once
>>>>             again to be sure that you don't use any cached things?
>>>>             If you were able to attach your sdcard image I would
>>>>             test it using my device and check if it really works
>>>>             because I don't see what could be wrong with that
>>>>             series. I don't think that ST has changed something
>>>>             between HW revision but I'm not able to locate on PCB
>>>>             what revision exactly is my board (I guess ST hasn't
>>>>             written it on the soldermask).
>>>>
>>>>
>>>>             Best
>>>>             Bartek
>>>>>
>>>>>             ??????? ??? ??, 7 ????? 2020 ?-22:27 ??? ?Bartosz
>>>>>             Bilas?? <?b.bilas@grinn-global.com
>>>>>             <mailto:b.bilas@grinn-global.com>??>:?
>>>>>
>>>>>                 Hi Shlomi,
>>>>>
>>>>>                 On 07.10.2020 21:13, Bartosz Bilas wrote:
>>>>>                 >
>>>>>                 > Hi Shlomi,
>>>>>                 >
>>>>>                 > On 07.10.2020 16:49, Shlomi Vaknin wrote:
>>>>>                 >> Adding support for wifi for stm32mp157c-dk2 is
>>>>>                 achieved by using
>>>>>                 >> another dts which includes the bindings for the
>>>>>                 wifi module.
>>>>>                 >> In addition, a txt file for the wifi firmware
>>>>>                 was added.
>>>>>                 >> This was copied from the yocto bsp layer of st.
>>>>>                 >>
>>>>>                 >> Signed-off-by: Shlomi
>>>>>                 Vaknin<shlomi.39sd@gmail.com
>>>>>                 <mailto:shlomi.39sd@gmail.com>>
>>>>>                 >> ---
>>>>>                 >> ?.../stm32mp157c-dk2/linux.config ? ? ? ? ? ?
>>>>>                 |? 4 +-
>>>>>                 >> ?.../overlay/boot/extlinux/extlinux.conf ? ?
>>>>>                 ?|? 2 +-
>>>>>                 >>? ?.../brcmfmac43430-sdio.st
>>>>>                 <http://brcmfmac43430-sdio.st>,stm32mp157c-dk2.txt
>>>>>                 | 59 +++++++++++++++++++
>>>>>                 >> ?.../stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts |
>>>>>                 32 ++++++++++
>>>>>                 >> ?configs/stm32mp157c_dk2_defconfig ? ? ? ? ?
>>>>>                 ?|? 7 ++-
>>>>>                 >>? ?5 files changed, 100 insertions(+), 4
>>>>>                 deletions(-)
>>>>>                 >>? ?create mode 100644
>>>>>                 board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st
>>>>>                 <http://brcmfmac43430-sdio.st>,stm32mp157c-dk2.txt
>>>>>                 >>? ?create mode 100644
>>>>>                 board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
>>>>>                 >>
>>>>>                 >> diff --git
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
>>>>>                 >> index c03eb748b4..4beee3a708 100644
>>>>>                 >> ---
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
>>>>>                 >> +++
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
>>>>>                 >> @@ -24,8 +24,6 @@ CONFIG_HIGHMEM=y
>>>>>                 >> ?CONFIG_FORCE_MAX_ZONEORDER=12
>>>>>                 >>? ?CONFIG_SECCOMP=y
>>>>>                 >>? ?# CONFIG_ATAGS is not set
>>>>>                 >> -CONFIG_ZBOOT_ROM_TEXT=0x0
>>>>>                 >> -CONFIG_ZBOOT_ROM_BSS=0x0
>>>>>                 >> ?CONFIG_ARM_APPENDED_DTB=y
>>>>>                 >> ?CONFIG_ARM_ATAG_DTB_COMPAT=y
>>>>>                 >>? ?CONFIG_VFP=y
>>>>>                 >> @@ -45,6 +43,7 @@ CONFIG_UNIX=y
>>>>>                 >>? ?CONFIG_INET=y
>>>>>                 >>? ?CONFIG_CAN=y
>>>>>                 >>? ?CONFIG_CAN_M_CAN=y
>>>>>                 >> +CONFIG_CFG80211=m
>>>>>                 >>? ?CONFIG_DEVTMPFS=y
>>>>>                 >>? ?CONFIG_DEVTMPFS_MOUNT=y
>>>>>                 >>? ?CONFIG_SIMPLE_PM_BUS=y
>>>>>                 >> @@ -66,6 +65,7 @@ CONFIG_SMSC911X=y
>>>>>                 >>? ?CONFIG_STMMAC_ETH=y
>>>>>                 >> ?CONFIG_DWMAC_DWC_QOS_ETH=y
>>>>>                 >>? ?CONFIG_MDIO_BITBANG=y
>>>>>                 >> +CONFIG_BRCMFMAC=m
>>>>>                 >>? ?CONFIG_INPUT_JOYDEV=y
>>>>>                 >>? ?CONFIG_INPUT_EVDEV=y
>>>>>                 >> ?CONFIG_INPUT_TOUCHSCREEN=y
>>>>>                 >> diff --git
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
>>>>>                 >> index 5b7f56ee77..a6595971a8 100644
>>>>>                 >> ---
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
>>>>>                 >> +++
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
>>>>>                 >> @@ -1,4 +1,4 @@
>>>>>                 >>? ?label stm32mp157c-dk2-buildroot
>>>>>                 >>? ? ?kernel /boot/zImage
>>>>>                 >> -? devicetree /boot/stm32mp157c-dk2.dtb
>>>>>                 >> +? devicetree /boot/stm32mp157c-dk2-wifi.dtb
>>>>>                 >>? ? ?append root=/dev/mmcblk0p4 rootwait
>>>>>                 >> diff --git
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st
>>>>>                 <http://brcmfmac43430-sdio.st>,stm32mp157c-dk2.txt
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st
>>>>>                 <http://brcmfmac43430-sdio.st>,stm32mp157c-dk2.txt
>>>>>                 >> new file mode 100644
>>>>>                 >> index 0000000000..b36de8837f
>>>>>                 >> --- /dev/null
>>>>>                 >> +++
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/overlay/lib/firmware/brcm/brcmfmac43430-sdio.st
>>>>>                 <http://brcmfmac43430-sdio.st>,stm32mp157c-dk2.txt
>>>>>                 >> @@ -0,0 +1,59 @@
>>>>>                 >> +# NVRAM file for BCM943430WLSELG
>>>>>                 >> +# 2.4 GHz, 20 MHz BW mode
>>>>>                 >> +
>>>>>                 >> +# The following parameter values are just
>>>>>                 placeholders, need to be updated.
>>>>>                 >> +manfid=0x2d0
>>>>>                 >> +prodid=0x0726
>>>>>                 >> +vendid=0x14e4
>>>>>                 >> +devid=0x43e2
>>>>>                 >> +boardtype=0x0726
>>>>>                 >> +boardrev=0x1202
>>>>>                 >> +boardnum=22
>>>>>                 >> +macaddr=00:90:4c:c5:12:38
>>>>>                 >> +sromrev=11
>>>>>                 >> +boardflags=0x00404201
>>>>>                 >> +boardflags3=0x08000000
>>>>>                 >> +xtalfreq=37400
>>>>>                 >> +#xtalfreq=19200
>>>>>                 >> +nocrc=1
>>>>>                 >> +ag0=255
>>>>>                 >> +aa2g=1
>>>>>                 >> +ccode=ALL
>>>>>                 >> +
>>>>>                 >> +pa0itssit=0x20
>>>>>                 >> +extpagain2g=0
>>>>>                 >> +
>>>>>                 >> +#PA parameters for 2.4GHz, measured at CHIP OUTPUT
>>>>>                 >> +pa2ga0=-168,7161,-820
>>>>>                 >> +AvVmid_c0=0x0,0xc8
>>>>>                 >> +cckpwroffset0=5
>>>>>                 >> +
>>>>>                 >> +# PPR params
>>>>>                 >> +maxp2ga0=84
>>>>>                 >> +txpwrbckof=6
>>>>>                 >> +cckbw202gpo=0
>>>>>                 >> +legofdmbw202gpo=0x66111111
>>>>>                 >> +mcsbw202gpo=0x77711111
>>>>>                 >> +propbw202gpo=0xdd
>>>>>                 >> +
>>>>>                 >> +# OFDM IIR :
>>>>>                 >> +ofdmdigfilttype=18
>>>>>                 >> +ofdmdigfilttypebe=18
>>>>>                 >> +# PAPD mode:
>>>>>                 >> +papdmode=1
>>>>>                 >> +papdvalidtest=1
>>>>>                 >> +pacalidx2g=32
>>>>>                 >> +papdepsoffset=-36
>>>>>                 >> +papdendidx=61
>>>>>                 >> +
>>>>>                 >> +il0macaddr=00:90:4c:c5:12:38
>>>>>                 >> +wl0id=0x431b
>>>>>                 >> +
>>>>>                 >> +deadman_to=0xffffffff
>>>>>                 >> +# muxenab: 0x1 for UART enable, 0x2 for GPIOs,
>>>>>                 0x8 for JTAG
>>>>>                 >> +muxenab=0x1
>>>>>                 >> +# CLDO PWM voltage settings - 0x4 - 1.1 volt
>>>>>                 >> +#cldo_pwm=0x4
>>>>>                 >> +
>>>>>                 >> +#VCO freq 326.4MHz
>>>>>                 >> +spurconfig=0x3
>>>>>                 >> diff --git
>>>>>                 a/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
>>>>>                 >> new file mode 100644
>>>>>                 >> index 0000000000..89747d2b5f
>>>>>                 >> --- /dev/null
>>>>>                 >> +++
>>>>>                 b/board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts
>>>>>                 >> @@ -0,0 +1,32 @@
>>>>>                 >> +/dts-v1/;
>>>>>                 >> +
>>>>>                 >> +#include "stm32mp157c-dk2.dts"
>>>>>                 >> +
>>>>>                 >> +/ {
>>>>>                 >> +? ? wifi_pwrseq: wifi-pwrseq {
>>>>>                 >> +? ? ? ? ? ? compatible = "mmc-pwrseq-simple";
>>>>>                 >> +? ? ? ? ? ? reset-gpios = <&gpioh 4
>>>>>                 GPIO_ACTIVE_LOW>;
>>>>>                 >> +? ? };
>>>>>                 >> +};
>>>>>                 >> +
>>>>>                 >> +/* Wifi */
>>>>>                 >> +&sdmmc2 {
>>>>>                 >> + arm,primecell-periphid = <0x10153180>;
>>>>>                 >> +? ? pinctrl-names = "default", "opendrain",
>>>>>                 "sleep";
>>>>>                 >> +? ? pinctrl-0 = <&sdmmc2_b4_pins_a>;
>>>>>                 >> +? ? pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
>>>>>                 >> +? ? pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
>>>>>                 >> +? ? non-removable;
>>>>>                 >> +? ? st,neg-edge;
>>>>>                 >> +? ? bus-width = <4>;
>>>>>                 >> +? ? vmmc-supply = <&v3v3>;
>>>>>                 >> +? ? mmc-pwrseq = <&wifi_pwrseq>;
>>>>>                 >> +? ? #address-cells = <1>;
>>>>>                 >> +? ? #size-cells = <0>;
>>>>>                 >> +? ? status = "okay";
>>>>>                 >> +
>>>>>                 >> +? ? brcmf: bcrmf at 1 {
>>>>>                 >> +? ? ? ? ? ? reg = <1>;
>>>>>                 >> +? ? ? ? ? ? compatible = "brcm,bcm4329-fmac";
>>>>>                 >> +? ? };
>>>>>                 >> +};
>>>>>                 >> diff --git a/configs/stm32mp157c_dk2_defconfig
>>>>>                 b/configs/stm32mp157c_dk2_defconfig
>>>>>                 >> index bf7b9868b1..9c2e436244 100644
>>>>>                 >> --- a/configs/stm32mp157c_dk2_defconfig
>>>>>                 >> +++ b/configs/stm32mp157c_dk2_defconfig
>>>>>                 >> @@ -9,8 +9,13 @@
>>>>>                 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
>>>>>                 >> ?BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>>>>                 >>
>>>>>                 ?BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
>>>>>                 >> ?BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>>>>                 >> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
>>>>>                 >>
>>>>>                 +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32mp157c-dk2/stm32mp157c-dk2-wifi.dts"
>>>>>                 >> ?BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>>>>                 >> +BR2_PACKAGE_LINUX_FIRMWARE=y
>>>>>                 >> +BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
>>>>>                 >> +BR2_PACKAGE_WIRELESS_REGDB=y
>>>>>                 >> +BR2_PACKAGE_WPA_SUPPLICANT=y
>>>>>                 >> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>>>>>                 >> ?BR2_TARGET_ROOTFS_EXT2=y
>>>>>                 >> ?BR2_TARGET_ROOTFS_EXT2_4=y
>>>>>                 >> ?BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>>>>
>>>>>                 I suggest to add
>>>>>                 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV to load
>>>>>                 firmware and driver automatically on boot.
>>>>>
>>>>>                 Unfortunately it doesn't work for me, see:
>>>>>
>>>>>                 [??? 4.186415] cfg80211: Loading compiled-in X.509
>>>>>                 certificates for
>>>>>                 regulatory database
>>>>>                 [??? 4.237180] cfg80211: Loaded X.509 cert
>>>>>                 'sforshee: 00b28ddf47aef9cea7'
>>>>>                 [??? 4.300765] brcmfmac: brcmf_fw_alloc_request:
>>>>>                 using
>>>>>                 brcm/brcmfmac43430-sdio for chip BCM43430/1
>>>>>                 [??? 5.389412] brcmfmac: brcmf_sdio_htclk: HT
>>>>>                 Avail timeout (1000000):
>>>>>                 clkctl 0x50
>>>>>                 [??? 6.407710] brcmfmac: brcmf_sdio_htclk: HT
>>>>>                 Avail timeout (1000000):
>>>>>                 clkctl 0x50
>>>>>
>>>>>                 Google says that it could be due to wrong nvram
>>>>>                 file configuration but I
>>>>>                 assume that you have run it successfully?
>>>>>
>>>>>                 # ifconfig -a
>>>>>                 eth0????? Link encap:Ethernet HWaddr 00:80:E1:42:56:44
>>>>>                 ?????????? BROADCAST MULTICAST MTU:1500? Metric:1
>>>>>                 ?????????? RX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 frame:0
>>>>>                 ?????????? TX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 carrier:0
>>>>>                 ?????????? collisions:0 txqueuelen:1000
>>>>>                 ?????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>>>>                 ?????????? Interrupt:49 Base address:0xe000
>>>>>
>>>>>                 lo??????? Link encap:Local Loopback
>>>>>                 ?????????? inet addr:127.0.0.1 Mask:255.0.0.0
>>>>>                 ?????????? inet6 addr: ::1/128 Scope:Host
>>>>>                 ?????????? UP LOOPBACK RUNNING MTU:65536? Metric:1
>>>>>                 ?????????? RX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 frame:0
>>>>>                 ?????????? TX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 carrier:0
>>>>>                 ?????????? collisions:0 txqueuelen:1000
>>>>>                 ?????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>>>>
>>>>>                 sit0????? Link encap:IPv6-in-IPv4
>>>>>                 ?????????? NOARP? MTU:1480 Metric:1
>>>>>                 ?????????? RX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 frame:0
>>>>>                 ?????????? TX packets:0 errors:0 dropped:0
>>>>>                 overruns:0 carrier:0
>>>>>                 ?????????? collisions:0 txqueuelen:1000
>>>>>                 ?????????? RX bytes:0 (0.0 B)? TX bytes:0 (0.0 B)
>>>>>
>>>>>                 #
>>>>>
>>>>>                 As you can see there is no wlan0 interface.
>>>>>
>>>>>                 Best
>>>>>                 Bartek
>>>>>
>>>>>
>>>>>             _______________________________________________
>>>>>             buildroot mailing list
>>>>>             buildroot at busybox.net  <mailto:buildroot@busybox.net>
>>>>>             http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>
>>     _______________________________________________
>>     buildroot mailing list
>>     buildroot at busybox.net  <mailto:buildroot@busybox.net>
>>     http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201012/402ba190/attachment.html>
