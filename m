From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 26 Nov 2009 09:27:00 -0600
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <87tywh8i25.fsf@macbook.be.48ers.dk>
References: <4B0BB941.7090202@dimacosystems.com>
	<4B0E5618.4010605@dimacosystems.com>
	<87tywh8i25.fsf@macbook.be.48ers.dk>
Message-ID: <200911260927.02506.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu November 26 2009, Peter Korsgaard wrote:
> >>>>> "Luca" == Luca Altobelli <LUCA.ALTOBELLI@dimacosystems.com> writes:
> 
> Hi,
> 
>  Luca> Dear Peter,
>  Luca> following your istructions:
>  Luca> dpkg -l \*snmp\*|grep ii
>  Luca> ii  libsnmp-base                               5.4.1~dfsg-12ubuntu3
>  Luca> SNMP (Simple Network Management Protocol) MI
>  Luca> ii  libsnmp15                                   5.4.1~dfsg-12ubuntu3
>  Luca> SNMP (Simple Network Management Protocol) li
> 
>  Luca> mounting the rootfs.i486.ext2 (used 2009.11-rc1 and net-snmp 5.5):
>  Luca> # snmpd -v
>  Luca> snmpd: can't load library 'libcrypto.so.0.9.8'
>  Luca> that I found in the host-lib directory , while in the  target-lib  I
>  Luca> have libcrypt-0.9.30.1.so.
> 
> You should also have a libcrypto on the target. E.G. with the config you
> posted I have:
> 
> file /tmp/br/target/usr/lib/libcrypto.so.0.9.8                      ~
> /tmp/br/target/usr/lib/libcrypto.so.0.9.8: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, stripped
> 
> If not, it sounds like something goes wrong with the openssl compilation
> and something gets confused about host/target.
> 
> I haven't been able to reproduce it with your config, but I'm on a
> x86-64 host, so that might be why - Sorry, I don't have any 32bit
> PCs any more.
> 

Sure you do, it is hidden inside of your x86_64 box.  ;)

Install the Linux-Vserver patch, set the option to emulate 32bit 
in your kernel config, build and boot kernel, install your choice
of 32bit distributions in an ARCH=x86 guest context.

I currently run Gentoo-32bit, Debian-32bit, Ubuntu-32bit on my
x86-64 box (all at the same time). It is a Core2Quad box.
Ah, yes, I also run the same threesum in 64bit also at the same time.

Bottom of the page: http://linux-vserver.org/Welcome_to_Linux-VServer.org
That project's idea of "Experimental" puts other project's idea of "Stable"
to shame.  ;)

Mike
> sudo mount -o loop,rw /tmp/br/images/rootfs.i486.ext2 /tmp/blah 
> sudo chroot /tmp/blah /bin/sh
> / # snmpd -v
> 
> NET-SNMP version:  5.5
> Web:               http://www.net-snmp.org/
> Email:             net-snmp-coders at lists.sourceforge.net
> 
>  Luca> I also asked in the uclibc mailing list and Carmelo Amoroso
>  Luca> replied: "[..]it seems that you are not using uClibc, instead you
>  Luca> are linking against glibc".
> 
> Indeed.
> 
