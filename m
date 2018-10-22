From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Mon, 22 Oct 2018 13:46:12 +0000
Subject: [Buildroot] Linux driver load failure with BR 2018.05
Message-ID: <AM4PR0802MB2210297D6D99BC3630A51C1BEAF40@AM4PR0802MB2210.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have build a custom Linux BS for a i.MX6SX base board (Linux 4.1.15 with Freescale/NXP patches).

Linux boots on device but I've got strange errors for some modules (which are part of Linux source code):
[    7.637965] bcmdhd: disagrees about version of symbol alloc_etherdev_mqs
[    7.644774] bcmdhd: Unknown symbol alloc_etherdev_mqs (err -22)
[    7.650832] bcmdhd: disagrees about version of symbol __nlmsg_put
[    7.657348] bcmdhd: Unknown symbol __nlmsg_put (err -22)
[    7.662748] bcmdhd: disagrees about version of symbol cfg80211_scan_done
[    7.669752] bcmdhd: Unknown symbol cfg80211_scan_done (err -22)
[    7.675814] bcmdhd: disagrees about version of symbol consume_skb
[    7.681916] bcmdhd: Unknown symbol consume_skb (err -22)
[    7.687755] bcmdhd: disagrees about version of symbol unregister_netdev
[    7.694428] bcmdhd: Unknown symbol unregister_netdev (err -22)
[    7.700298] bcmdhd: disagrees about version of symbol cfg80211_remain_on_channel_expired
...
[    8.991856] bcmdhd: disagrees about version of symbol wiphy_free
[    8.998191] bcmdhd: Unknown symbol wiphy_free (err -22)
[    9.003479] bcmdhd: disagrees about version of symbol register_netdevice
[    9.010457] bcmdhd: Unknown symbol register_netdevice (err -22)
modprobe: can't load module bcmdhd (kernel/drivers/net/wireless/bcmdhd/bcmdhd.ko): Invalid argument
...
[    9.951557] gpio_mcp23s08: disagrees about version of symbol dev_err
[    9.961581] gpio_mcp23s08: Unknown symbol dev_err (err -22)
...
modprobe: can't load module gpio_mcp23s08 (kernel/drivers/gpio/gpio-mcp23s08.ko): Invalid argument
...
[   10.037540] mcp251x: disagrees about version of symbol can_free_echo_skb
[   10.046368] mcp251x: Unknown symbol can_free_echo_skb (err -22)
[   10.055396] mcp251x: disagrees about version of symbol can_put_echo_skb
[   10.062025] mcp251x: Unknown symbol can_put_echo_skb (err -22)
[   10.068195] mcp251x: disagrees about version of symbol consume_skb
[   10.074430] mcp251x: Unknown symbol consume_skb (err -22)
[   10.079845] mcp251x: disagrees about version of symbol can_get_echo_skb
[   10.086825] mcp251x: Unknown symbol can_get_echo_skb (err -22)
[modprobe: can't load module mcp251x (kernel/drivers/net/can/spi/mcp251x.ko): Invalid argument



I can't figure out why I have "unknown symbol" errors and only for those drivers? All other drivers are working well (Serial/Ethernet/SDCard/etc).
Thanks' in advance for any help.

Best regards

Fabrice Mousset

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181022/1700eaa2/attachment.html>
