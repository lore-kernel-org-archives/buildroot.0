From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Thu, 20 Apr 2017 22:13:15 -0500
Subject: [Buildroot] VLAN interface and IPv6 SLAAC
Message-ID: <CALD51P_iTYjDx7dNBcqpCpFrhE_5uVaK+UHF8XR=1Z2p=Ypi-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marvell A38x SDK Buildroot-2015.11 which comes with Busybox-1.24.1.
I need to add VLAN interface and get SLAAC address from this interface.
I could add VLAN interface  with the following commands
vconfig add eth1 3004   - vconfig is from busybox
ifconfig eth1.3004  up
ifconfig -a      - see the outpout of eth1.3004

Two Questions:
(1) How can  I  generate this VLAN interface eth1.3004 automatically on
boot-up ?
(2) Option  makes eth1.2004  aquires IPv6 SLAAC ?
      My board vendor  says the slaac router advertisement is working.

//////////////////////////////////////////////////////////////////////////////////////////////////
eth1.3004 Link encap:Ethernet  HWaddr 00:50:43:66:35:37
          inet6 addr: fe80::250:43ff:fe66:3537/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:468 (468.0 B)
//////////////////////////////////////////////////////////////////////////////////////////////////
Thank you so much,
 Lijun Qin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170420/e7db05ac/attachment.html>
