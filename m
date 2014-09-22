From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Sep 2014 22:44:20 +0200
Subject: [Buildroot] where is libdns_sd.so?
In-Reply-To: <CAK9TtU2BUcZpPVnvGAsYXShYr+ctAR-g2k3KLXgGG_kALPBNMg@mail.gmail.com>
 (Sylvain LG's message of "Mon, 22 Sep 2014 20:46:16 +0200")
References: <CAK9TtU2BUcZpPVnvGAsYXShYr+ctAR-g2k3KLXgGG_kALPBNMg@mail.gmail.com>
Message-ID: <87vbof2xnf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sylvain" == Sylvain LG <forum@sylvainlegourr.com> writes:

 > Hello,
 > I've just compiled my system with target package Avahi:

 > [*] avahi ? ? ? ? ? ? ? ? ? ? ? ? ? ? ??
 > [*] ? IPv4LL network address configuration daemon?
 > [*] ? mDNS/DNS-SD daemon?

 > I need?libdns_sd.so to develop a zeroconf application.

 > But no such a lib is compiled altough a find ./output -name *dns_sd* displays:


 >     ./build/avahi-0.6.31/avahi-compat-libdns_sd
 >     ./build/avahi-0.6.31/avahi-compat-libdns_sd/dns_sd.h
 >     ./build/avahi-0.6.31/avahi-compat-libdns_sd.pc.in

the bonjour compatibility library is not built by default, but needs be
explicitly be enabled at configure time with --enable-compat-libdns_sd.

We don't currently have a Buildroot option to enable this, but I'll add
it now.

-- 
Bye, Peter Korsgaard
