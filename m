From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 1 Sep 2015 15:36:48 -0700
Subject: [Buildroot] Starting network...
In-Reply-To: <20150902001213.6aa70acb@free-electrons.com>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
 <20150825195452.2d7be97c@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C3459F@svr-wa-exch1.atg.lc>
 <20150901211412.5a71ae8e@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C345D2@svr-wa-exch1.atg.lc>
 <20150902001213.6aa70acb@free-electrons.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C345DB@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I should have noticed that the .dts files come along with the kernel source downloading.

I just discovered the output/build/linux-headers-4.0.4/arch/arm/boot/dts/armada-388-gp.dts. I will not use it since, as you mentioned, the 388 board differs from the 385 one I am using.

After I added following lines into the /etc/network/interfaces file and did the "ifdown eth0" and "ifup eth0" commands, my "ifconfig -a" command shows following result. Now my system has two network interfaces enabled.

Thanks for your help!

Tommy

# vi /etc/network/interfaces
.....
iface eth0 inet static
address 192.168.1.5
gateway 192.168.1.254
netmask 255.255.255.0

# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:50:43:48:16:4D
          inet addr:192.168.1.5  Bcast:0.0.0.0  Mask:255.255.255.0
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:532
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Interrupt:36

eth1      Link encap:Ethernet  HWaddr 00:50:43:48:EC:4D
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:532
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Interrupt:37

eth2      Link encap:Ethernet  HWaddr 00:50:43:EC:16:4D
          inet addr:10.28.1.47  Bcast:10.28.1.255  Mask:255.255.255.0
          inet6 addr: fe80::250:43ff:feec:164d/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4031 errors:0 dropped:3 overruns:0 frame:0
          TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:532
          RX bytes:461861 (451.0 KiB)  TX bytes:1332 (1.3 KiB)
          Interrupt:38

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
