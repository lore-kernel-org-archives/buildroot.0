From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 15:41:22 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <4B0E5618.4010605@dimacosystems.com> (Luca Altobelli's message of
	"Thu\, 26 Nov 2009 11\:19\:04 +0100")
References: <4B0BB941.7090202@dimacosystems.com>
	<87iqcyc3su.fsf@macbook.be.48ers.dk>
	<4B0D5435.4090002@dimacosystems.com>
	<87einmblsr.fsf@macbook.be.48ers.dk>
	<4B0E5618.4010605@dimacosystems.com>
Message-ID: <87tywh8i25.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Altobelli <LUCA.ALTOBELLI@dimacosystems.com> writes:

Hi,

 Luca> Dear Peter,
 Luca> following your istructions:
 Luca> dpkg -l \*snmp\*|grep ii
 Luca> ii  libsnmp-base                               5.4.1~dfsg-12ubuntu3
 Luca> SNMP (Simple Network Management Protocol) MI
 Luca> ii  libsnmp15                                   5.4.1~dfsg-12ubuntu3
 Luca> SNMP (Simple Network Management Protocol) li

 Luca> mounting the rootfs.i486.ext2 (used 2009.11-rc1 and net-snmp 5.5):
 Luca> # snmpd -v
 Luca> snmpd: can't load library 'libcrypto.so.0.9.8'
 Luca> that I found in the host-lib directory , while in the  target-lib  I
 Luca> have libcrypt-0.9.30.1.so.

You should also have a libcrypto on the target. E.G. with the config you
posted I have:

file /tmp/br/target/usr/lib/libcrypto.so.0.9.8                      ~
/tmp/br/target/usr/lib/libcrypto.so.0.9.8: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, stripped

If not, it sounds like something goes wrong with the openssl compilation
and something gets confused about host/target.

I haven't been able to reproduce it with your config, but I'm on a
x86-64 host, so that might be why - Sorry, I don't have any 32bit
PCs any more.

sudo mount -o loop,rw /tmp/br/images/rootfs.i486.ext2 /tmp/blah 
sudo chroot /tmp/blah /bin/sh
/ # snmpd -v

NET-SNMP version:  5.5
Web:               http://www.net-snmp.org/
Email:             net-snmp-coders at lists.sourceforge.net

 Luca> I also asked in the uclibc mailing list and Carmelo Amoroso
 Luca> replied: "[..]it seems that you are not using uClibc, instead you
 Luca> are linking against glibc".

Indeed.

-- 
Bye, Peter Korsgaard
