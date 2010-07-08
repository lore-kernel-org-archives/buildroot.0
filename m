From: Mohamed Mohamed Nour El-Din <eng.mohamed.nour.eldin@gmail.com>
Date: Fri, 9 Jul 2010 02:55:21 +0300
Subject: [Buildroot] Buildroot & wireless
Message-ID: <AANLkTilq5KHsvMKOgoulB8lt35Ko7GjBHWexKQffzdUx@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
i built a system using buildroot to run on a mini2440 board with kernel
2.6.32
i installed wireless tools & dhclient with the system
i got a realtek 8187B usb wireless card, i installed its driver from the
kernel configuration & i used it on the board
the problem is that i can't access the internet
the board can see the LAN & i could bing a machine on the same network, but
no internet access

using dhcp (wlan0 is the interface name):
ifconfig wlan0 down
dhclient -r  wlan0
ifconfig wlan0 up
iwconfig wlan0 essid "3Com"
iwconfig wlan0 mode Managed
dhclient wlan0

using static ip:
ifconfig wlan0 down
dhclient -r  wlan0
ifconfig wlan0 192.168.1.131 netmask 255.255.255.0 up
route add default gw 192.168.1.1
iwconfig wlan0 essid "3Com"
iwconfig wlan0 mode Managed
& i added "nameserver 192.168.100.2" to /etc/resolv.conf

is this right or enough to get the wifi working?

thnx a lot,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100709/90603c1b/attachment-0001.html>
