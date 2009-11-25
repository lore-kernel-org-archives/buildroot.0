From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Nov 2009 17:40:04 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <4B0D5435.4090002@dimacosystems.com> (Luca Altobelli's message of
	"Wed\, 25 Nov 2009 16\:58\:45 +0100")
References: <4B0BB941.7090202@dimacosystems.com>
	<87iqcyc3su.fsf@macbook.be.48ers.dk>
	<4B0D5435.4090002@dimacosystems.com>
Message-ID: <87einmblsr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Altobelli <LUCA.ALTOBELLI@dimacosystems.com> writes:

Hi,

 Luca> I tried 2009.11-rc1 and net-snmp 5.5 with same results. It only
 Luca> works with old versions (net-snmp 5.1.2 works).

Odd, it works here:

mkdir /tmp/blah
sudo mount -o loop,rw /tmp/br/images/rootfs.i686.ext2 /tmp/blah
sudo chroot /tmp/blah /bin/sh

/ # snmpd -v

NET-SNMP version:  5.5
Web:               http://www.net-snmp.org/
Email:             net-snmp-coders at lists.sourceforge.net

/ #  

Do you have any libsnmp (development-) packages installed on your host?
On my system there's:

dpkg -l \*snmp\*|grep ii
ii  libsnmp-base   5.4.1~dfsg-12  SNMP (Simple Network Management Protocol) MI
ii  libsnmp15      5.4.1~dfsg-12  SNMP (Simple Network Management Protocol) li

So no -dev packages. I'll retry with your exact config in a moment.

-- 
Bye, Peter Korsgaard
