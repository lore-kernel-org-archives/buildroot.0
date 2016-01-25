From: Chris LaRocque <Clarocq@gmail.com>
Date: Mon, 25 Jan 2016 06:16:13 +0000 (UTC)
Subject: [Buildroot]
	=?utf-8?q?ssh=3A_connect_to_host_pi_adress_port_22=3A?=
	=?utf-8?q?_Connection=09refused?=
References: <CABi8WTyCkO0dbH0GKkwV+C4Hb_OtaPipk06zBuNCuDJoHK7bLA@mail.gmail.com>
Message-ID: <loom.20160125T071123-991@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FrAnKenStEiN MC <chfakht@...> writes:

> 
> 
> 
> i'm having some trouble when trying to 
connect to my raspberry b+. i have used 
**buildroot** with raspberrypi_defconfig 
and add dropBear package for SSH , change 
hostname to pi and root password to 123.
> make runned successfully and i was able 
to deploy the necessary files on the pi 
...
> 
> 
> I gave the pi a static adress 
`10.42.0.5` and it's detected correctly in 
my ethernet network
> here are some commands :
> 
> ? ? nmap -sP 10.42.0.0/24
> 
> ? ? Starting Nmap 6.40 ( http://nmap.org 
) at 2016-01-25 02:23 WET
> ? ? Nmap scan report for 10.42.0.1
> ? ? Host is up (0.00017s latency).
> ? ? Nmap scan report for 10.42.0.5
> ? ? Host is up (0.0069s latency).
> ? ? Nmap done: 256 IP addresses (2 hosts 
up) scanned in 2.61 seconds
> 
> The pi adress is `10.42.0.5`
> 
> For the ping it runs successfully
> 
> ? ? ping -c 3 10.42.0.5
> ? ? PING 10.42.0.5 (10.42.0.5) 56(84) 
bytes of data.
> ? ? 64 bytes from 10.42.0.5: icmp_seq=1 
ttl=64 time=4.83 ms
> ? ? 64 bytes from 10.42.0.5: icmp_seq=2 
ttl=64 time=3.03 ms
> ? ? 64 bytes from 10.42.0.5: icmp_seq=3 
ttl=64 time=2.03 ms
> ? ??
> ? ? --- 10.42.0.5 ping statistics ---
> ? ? 3 packets transmitted, 3 received, 
0% packet loss, time 2003ms
> ? ? rtt min/avg/max/mdev = 
2.035/3.303/4.836/1.158 ms
> 
> But whe trying ssh i get `connection 
refused`
> 
> ? ? ssh pi <at> 10.42.0.5
> 
> ? ? ssh: connect to host 10.42.0.5 port 
22: Connection refused
> 
> I couldn't solve this problem all the 
day !!!
> 
> thanks a lot
> 
> ?
> 
> 
> 
__________________________________________
_____
> buildroot mailing list
> buildroot at ...
> 
http://lists.busybox.net/mailman/listinfo/
buildroot

Hello Frank

I had a similar problem when starting with 
my beaglebone black. Set the filesystem to 
be mounted read/write. I suspect that 
dropbear needs to write the ssh key to 
file.

Regards

Chris
