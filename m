From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 6 Oct 2014 11:41:39 +0200
Subject: [Buildroot] how to restart network interface automatically
In-Reply-To: <1039764800.26168682.1412578179624.JavaMail.root@openwide.fr>
References: <CAK9TtU2PL8yxy=6Exn_-wTVE9z-TdEhD9tw-FL=LG165D2p+cg@mail.gmail.com>
 <1039764800.26168682.1412578179624.JavaMail.root@openwide.fr>
Message-ID: <A324D01FB41B4AA19215E581238DB3DB@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

You can use the -b option in the busybox dhcp option list.
This forks DHCP to the background if the interface was'nt up ut boottime.

I use :

CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -b"


Don't forget /etc/network/interfaces :
auto eth0
iface eth0 inet dhcp

Regards Johan



-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Jeremy Rosen
Verzonden: maandag 6 oktober 2014 8:50
Aan: Sylvain LG
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] how to restart network interface automatically


> 
> Hello,
> 
> 
> my network interface eth0 is configured to use DHCP.
> 
> 
> At boot time, init script S40network starts the network. And if DHCP 
> server - for any reason - can't answer, no IP will be set for eth0.
> 
> 
> What will be the correct strategy to handle this case?
> 

IIIRC the problem is in the busybox DHCP which doesn't retry on failure by default, 

fortunately this is just a config option for busybox, so if you do a make busybox-menuconfig you can change that behaviour


run "udhcpc --help" on the target to see what options are available

set IFUPDOWN_UDHCPC_CMD_OPTIONS to whatever fits you ned




> 
> Best regards,
> 
> 
> Sylvain
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
