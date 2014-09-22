From: Nimai Mahajan <nimaim@gmail.com>
Date: Mon, 22 Sep 2014 21:05:34 +0000 (UTC)
Subject: [Buildroot] =?utf-8?q?where_is_libdns=5Fsd=2Eso=3F?=
References: <CAK9TtU2BUcZpPVnvGAsYXShYr+ctAR-g2k3KLXgGG_kALPBNMg@mail.gmail.com>
 <87vbof2xnf.fsf@dell.be.48ers.dk>
Message-ID: <loom.20140922T230412-185@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@...> writes:

> 
> >>>>> "Sylvain" == Sylvain LG <forum <at> sylvainlegourr.com> writes:
> 
>  > Hello,
>  > I've just compiled my system with target package Avahi:
> 
>  > [*] avahi ? ? ? ? ? ? ? ? ? ? ? ? ? ? ??
>  > [*] ? IPv4LL network address configuration daemon?
>  > [*] ? mDNS/DNS-SD daemon?
> 
>  > I need?libdns_sd.so to develop a zeroconf application.
> 
>  > But no such a lib is compiled altough a find ./output -name 
*dns_sd* displays:
> 
>  >     ./build/avahi-0.6.31/avahi-compat-libdns_sd
>  >     ./build/avahi-0.6.31/avahi-compat-libdns_sd/dns_sd.h
>  >     ./build/avahi-0.6.31/avahi-compat-libdns_sd.pc.in
> 
> the bonjour compatibility library is not built by default, but needs 
be
> explicitly be enabled at configure time with --enable-compat-
libdns_sd.
> 
> We don't currently have a Buildroot option to enable this, but I'll 
add
> it now.
> 

Thanks Peter! Our application will also require this for a fully-
complaint zeroconf solution (using a C application) to detect connected 
clients in real-time.
