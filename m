From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Tue, 16 Jan 2007 11:55:05 -0700
Subject: [Buildroot] /etc/network/interfaces
Message-ID: <45AD1F89.4050901@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
   I have a system that uses buildroot I built a few years ago. The 
client asked that we changed the network config from a static one to 
dhcp, dhclient seems to be installed and so we edited 
/etc/network/interfaces and changed it from what it was to this:

auto lo
iface lo inet loopback


iface eth0 inet dhcp
#address 192.168.0.200
#netmask 255.255.255.0
#broadcast 192.168.0.255
#address 10.0.0.199
#netmask 255.255.255.0
#broadcast 10.0.0.255
auto eth0

This machine doesn't have a keyboard or anything and is intended to be 
remotely administered. Upon reboot, we don't have the IP of the machine 
and can't seem to find it. Is this config file above correct? Its been 
almost 2 years since I touched this.

-- 
Nathanael D. Noblet
