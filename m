From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Thu, 17 Sep 2015 01:56:20 +0200
Subject: [Buildroot] =?windows-1252?q?problem_booting_from_ext2_=B5sd_card?=
Message-ID: <55FA01A4.5070107@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
just extracted my rootfs to a ?sd card
configured u-boot to boot from it

Any idea ? i have a single ext2 partition on a 4GB transcend class 10 card.
not sure where to start searching...
Tried several cards with equal results.
used cfdisk as tool.

snip from bootlog


usbcore: registered new interface driver usb-storage
ci_hdrc ci_hdrc.1: EHCI Host Controller
ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
input: 20b8000.kpp as 
/devices/soc0/soc/2000000.aips-bus/20b8000.kpp/input/input0
input: EP0700M06 as 
/devices/soc0/soc/2100000.aips-bus/21a8000.i2c/i2c-2/2-0038/input/input1
rtc-ds1307 0-0068: rtc core: registered ds1339 as rtc0
snvs_rtc 20cc034.snvs-rtc-lp: rtc core: registered 20cc034.snvs-rtc-lp 
as rtc1
i2c /dev entries driver
mxc_v4l2_output v4l2_out: V4L2 device registered as video16
mxc_v4l2_output v4l2_out: V4L2 device registered as video17
imx2-wdt 20bc000.wdog: timeout 60 sec (nowayout=0)
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
mmc0: no vqmmc regulator found
mmc0: no vmmc regulator found
mmc0: SDHCI controller on 2190000.usdhc [2190000.usdhc] using ADMA
mmc1: no vqmmc regulator found
mmc1: no vmmc regulator found
mmc1: SDHCI controller on 2194000.usdhc [2194000.usdhc] using ADMA
galcore: clk_get vg clock failed, disable vg!
Galcore version 5.0.11.25762
mmc0: new high speed SDHC card at address 59b4
*mmcblk0: mmc0:59b4 USD   3.74 GiB
  mmcblk0: p1*
mxc_vpu 2040000.vpu: VPU initialized
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
sgtl5000 2-000a: sgtl5000 revision 0x11
2-000a: 1200 mV normal
sgtl5000 2-000a: Using internal LDO instead of VDDD
imx-sgtl5000 sound: sgtl5000 <-> 2028000.ssi mapping ok
TCP: cubic registered
NET: Registered protocol family 10
sit: IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
can: controller area network core (rev 20120528 abi 9)
NET: Registered protocol family 29
can: raw protocol (rev 20120528)
can: broadcast manager protocol (rev 20120528 t)
can: netlink gateway (rev 20130117) max_hops=1
8021q: 802.1Q VLAN Support v1.8
Key type dns_resolver registered
failed to disable 1.2 GHz OPP
Registering SWP/SWPB emulation handler
input: gpio-keys as /devices/soc0/gpio-keys/input/input2
rtc-ds1307 0-0068: setting system clock to 2000-01-01 13:27:11 UTC 
(946733231)
ALSA device list:
   #0: sgtl5000-audio
VFS: Mounted root (ext2 filesystem) on device 179:1.
devtmpfs: mounted
Freeing unused kernel memory: 252K (80835000 - 80874000)
Starting logging: OK
Populating /dev using udev: udevd[116]: starting version 3.1.1
random: udevd urandom read with 55 bits of entropy available
done
Initializing random number generator... done.
Starting system message bus: done
Starting rpcbind: OK
Starting network...
fec 2188000.ethernet eth0: Freescale FEC PHY driver [SMSC 
LAN8710/LAN8720] (mii_bus:phy_addr=2188000.ethernet:00, irq=-1)
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc (v1.23.2) started
Sending discover...
Sending discover...
fec 2188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Sending discover...
Sending select for 192.168.1.145...
Lease of 192.168.1.145 obtained, lease time 3600
deleting routers
adding dns 192.168.1.1
Starting ntpd: OK
Starting dropbear sshd: OK
Starting inetd : OK
/etc/init.d/S80tunetouch: line 16: can't create 
/sys/bus/i2c/devices/0-0038/threshold: nonexistent directory
/etc/init.d/S80tunetouch: line 16: can't create 
/sys/bus/i2c/devices/0-0038/gain: nonexistent directory
/etc/init.d/S80tunetouch: line 16: can't create 
/sys/bus/i2c/devices/0-0038/report_rate: nonexistent directory
Starting mpd: OK
Segmentation fault
fb-test 1.1.0 (rosetta)
fb res 800x480 virtual 800x480, line_len 3200, bpp 32
attempt to access beyond end of device
mmcblk0p1: rw=0, want=11524007040, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=33325320632, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=20728214080, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=8149861624, limit=7857074
attempt to access beyond end of device
Welcome to Buildrootmmcblk0p1: rw=0, want=26925577088, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=11576436144, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=26035639288, limit=7857074
attempt to access beyond end of device
apex_systems login: mmcblk0p1: rw=0, want=30960508736, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=873814192, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=18769465248, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=13401729144, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=8730814792, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=30741356216, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=7043620368, limit=7857074
attempt to access beyond end of device
mmcblk0p1: rw=0, want=13247852320, limit=7857074
attempt to access beyond end of device

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150917/b8cdd2f8/attachment.html>
