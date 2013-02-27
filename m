From: mathematician1975 <pcooper1975@googlemail.com>
Date: Wed, 27 Feb 2013 08:46:47 -0800 (PST)
Subject: [Buildroot] segfault in uClibc-0.9.33.2 when using busybox ip
Message-ID: <1361983607940-41081.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have used buildroot to generate my crosstools, root file system, kernel
(3.6.11) and busybox (1.21.0) for an i386 (Geode) target board. Basically I
am using buildroot to generate everything. I was recently trying to
configure my network but when I invoked the following from the command line

# ip addr show dev eth0

I received the following report of a segfault.

2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
    1000 link/ether 00:18:7d:19:a0:d8 brd ff:ff:ff:ff:ff:ff
    inet 172.18.255.212/24 brd 172.18.255.255 scope global eth0
[  331.700545] ip[951]: segfault at 0 ip b76e1f26 sp bfbd29b0 error 4 in 
libuClibc-0.9.33.2.so[b76b5000+4d000]
Segmentation fault

I have searched these archives for similar reports but I cannot find
anything. I would be very grateful for any advice that anyone who has had a
similar problem can offer, or how I go about trying to establish if this is
down to user error on my part or a bug in busybox/uClibc. 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/segfault-in-uClibc-0-9-33-2-when-using-busybox-ip-tp41081.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
