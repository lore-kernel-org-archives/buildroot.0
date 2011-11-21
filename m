From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Mon, 21 Nov 2011 12:32:27 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
Message-ID: <4ECA36CB.5010803@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm trying to run buildroot 2011.08 on an atom based board, but I have a problem with the network driver:

It's a realtek gigabit network device, the traces say RTL8168d/8111d:

r8168 Gigabit Ethernet driver 2.3LK-NAPI loaded
r8169 0000:01:00.0: PCI INT A -> Link[LNKA] -> GSI 11 (level, low) -> IRQ 11
r8169 0000:01:00.0: no MSI. Back to INTx.
r8169 0000:01:00.0: eth0: RTL8168d/8111d at 0xf8012000, 70:71:bc:31:87:6f, XID 081000c0 IRQ 11

When I want to bring it up, it freezes for a minute or two before I get the following message:

r8169 0000:01:00.0: eth0: unable to load firmware patch rtl_nic/rtl8168d-1.fw (-2)
r8169 0000:01:00.0: eth0: link down
r8169 0000:01:00.0: eth0: link down
ADDRCONF(NETDEV_UP): eth0: link is not ready
r8169 0000:01:00.0: eth0: link up
ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

at this point, the network seems to work, it gets a DHCP lease.

after some more minutes, I get another error which does not happen if I don't bring the network up:

irq 7: nobody cared (try booting with the "irqpoll" option)
Pid: 0, comm: swapper Not tainted 3.0.4 #1
Call Trace:
(...)
handlers:
[<c11a1050>] usb_hcd_irq
Disabling IRQ #7

I have tried to put a the rtl8168d-1.fw and rtl8168d-1.fw in /lib/firmware/rtl_nic directory
I tried to define the CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware" but it requires to define CONFIG_EXTRA_FIRMWARE and I
don't know what to set it to. I tried with "rtl8168d" and some variations but it didn't work
I also tried to deactivate firmware support but it doesn't seem to have any effect, I'm not sure I did that correctly
though.

I googled the error messages but didn't find any solution so I'm stuck.
The firmware thing apparently appeared with kernel 2.6.38
I had an old version of buildroot that works with this hardware but it's from early 2009 and the config file changed
deeply since then.

Any idea welcome,

regard,

-- 
Emmanuel
