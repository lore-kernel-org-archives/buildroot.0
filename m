From: Tobias McNulty <tobias@caktusgroup.com>
Date: Tue, 28 Apr 2009 16:46:47 -0400
Subject: [Buildroot] udhcpc: sendto: Network is down
Message-ID: <49F76B37.9040601@caktusgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been working with a buildroot-2009.02 environment that I built for
a TS-7400 board (uses a 2.4 kernel) quite successfully for several
months now.  So far I've been configuring the board's network settings
manually using ifconfig and route.

Recently I tried to start using DHCP, but udhcpc is not happy about
something:

# ifconfig eth0 up
# ifconfig eth0

eth0      Link encap:Ethernet  HWaddr 00:D0:69:40:7C:D6

          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

          RX packets:51 errors:0 dropped:0 overruns:0 frame:0

          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0

          collisions:0 txqueuelen:1000

          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

          Interrupt:39
# udhcpc -i eth0

udhcpc (v1.13.2) started

Sending discover...

udhcpc: sendto: Network is down

Sending discover...

udhcpc: sendto: Network is down


I've verified the network is actually up (all the lights are on).  If I
configure an IP address manually it works fine, e.g.:

# ifconfig eth0 192.168.1.30 up

# ping 192.168.1.1

PING 192.168.1.1 (192.168.1.1): 56 data bytes

64 bytes from 192.168.1.1: seq=0 ttl=64 time=0.000 ms

64 bytes from 192.168.1.1: seq=1 ttl=64 time=0.000 ms

64 bytes from 192.168.1.1: seq=2 ttl=64 time=0.000 ms



--- 192.168.1.1 ping statistics ---

3 packets transmitted, 3 packets received, 0% packet loss

round-trip min/avg/max = 0.000/0.000/0.000 ms

What could I be missing?

Thanks
Tobias
-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com
