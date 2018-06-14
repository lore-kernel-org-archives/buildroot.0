From: Anuj Malviya <anuj.malviya@gmail.com>
Date: Wed, 13 Jun 2018 20:39:28 -0700 (MST)
Subject: [Buildroot] udhcpc: no lease, failing
Message-ID: <1528947568280-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Friends
I am getting this problem with Buildroot.

Starting network: udhcpc: started, v1.27.2
[    2.928374] net eth0: initializing cpsw version 1.12 (0)
[    2.933951] net eth0: initialized cpsw ale version 1.4
[    2.939382] net eth0: ALE Table size 1024
[    2.945195] libphy: PHY 4a101000.mdio:00 not found
[    2.950239] net eth0: phy "4a101000.mdio:00" not found on slave 0, err
-19
[    2.957426] libphy: PHY 4a101000.mdio:01 not found
[    2.962456] net eth0: phy "4a101000.mdio:01" not found on slave 1, err
-19
[    2.980308] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
udhcpc: sending discover
udhcpc: sending discover
udhcpc: sending discover
udhcpc: no lease, failing
Failed to bring up eth0.
FAIL
Starting dhcpcd...
no interfaces have a carrier
forked to background, child pid 149
Starting Network Interface Plugging Daemon: eth0.
Starting ntpd: OK
Starting dropbear sshd: [   12.722674] random: dropbear: uninitialized
urandom read (32 bytes read, 29 bits of entropy available)
OK
Starting vsftpd: OK

Welcome to Buildroot
buildroot login: root
Password:
# ifconfig
eth0      Link encap:Ethernet  HWaddr E8:EB:11:28:E6:73  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Interrupt:174

The IP does not get assigned and I have power reboot my system couple of
times to get the IP assignment.
I am using 4.4.41 kernel version and glibc.
I read in earlier posts that this problem occurs with is uclibc, not sure of
the solution , any pointers will be of great help.
Br
Anuj 



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
