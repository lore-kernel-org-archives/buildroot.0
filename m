From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 21 Sep 2012 08:38:36 +0000 (UTC)
Subject: [Buildroot] DNS resolv issue with localhost
References: <23843298-AAFD-4E03-A77D-2883BBA856B2@labri.fr>
 <4E130353.7030207@labri.fr> <20110705210437.47fd7806@skate>
Message-ID: <loom.20120921T103525-82@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@...> writes:

> 
> Le Tue, 05 Jul 2011 14:28:03 +0200,
> Jigar SOLANKI <jigar.solanki <at> labri.fr> a ?crit :
> 
> > Problem SOLVED :
> > I was missing the nsswitch.conf file in /etc, so the resolv order was
> > wrong (nslookup localhost was requesting the dns server in
> > /etc/resolv.conf whereas it should have beeb /etc/hosts)
> > I just added a nsswitch.conf from an another correctly running linux.
> 
> So you're using a glibc-based system, right ? If so, maybe we should
> add this nsswitch.conf file to the default Buildroot and make sure it
> gets installed when a glibc toolchain is used.
> 
> Thomas

I just ran into the exact same problem, and here is a links to a LFS manual
stating the problem as well :
http://archive.linuxfromscratch.org/lfs-museum/4.1/LFS-BOOK-4.1-HTML/chapter06/glibc.html#AEN2505

So yes I think that should be good to ship nsswitch.conf.

For information, I used the nsswitch.conf file found in my external toolchain
sysroot that was re-created under buildroot, in my case it was at

<buildroot_path>/output/host/usr/sh4-unknown-linux-gnu/sysroot/etc/nsswitch.conf

Kind regards,
Lionel
