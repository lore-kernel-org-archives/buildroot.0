From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Nov 2015 11:48:18 +0100
Subject: [Buildroot] issue with dhcp on buildroot
In-Reply-To: <2864886.JM8PMHTYst@mars>
References: <2864886.JM8PMHTYst@mars>
Message-ID: <56431CF2.6090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-11-15 09:47, Michael Schweikart wrote:
> Hi,
> 
> i have setup a buildroot environment and build it. I deploy it on device under 
> test and the systems boots up(Kernel Version 4.3). As soon as the network and 
> udhcpc (v1.24.1) starts i get the following messages. 
> 
> Sending discover...
> udhcpc: sendto: Invalid argument.
> Sending discover...
> udhcpc: sendto: Invalid argument.
> No lease, failing

 Is it possible that the Ethernet device doesn't exist yet when udhcpc starts?

 When you start it from the command line, does it work?

> 
> If i setup an static ip address i am able to ping the device under test. I try 
> to ping a IP form the device under test i get the following error.
> 
> ping: sendto: Destination address required

 So you did the following:

ifconfig eth0 up 192.168.1.1
ping 192.168.1.2

 and you get the 'Destination address required' error?

 Does ping to the configured address work?

 When you wireshark the link, do you see anything coming out?


 Regards,
 Arnout

> 
> Is there anybody out there how can support me?
> 
> best regards
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
