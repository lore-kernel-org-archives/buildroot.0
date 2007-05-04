From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Fri, 4 May 2007 09:34:25 +0200
Subject: [Buildroot] gcc-4.1.2 eabi softfloat toolchain,
	undefined reference to "raise"
In-Reply-To: <20070503095759.GA552@aon.at>
References: <20070426080257.GA7608@z1.synertronixx>
	<20070430125731.GC18543@aon.at>
	<20070503083551.GB2783@z1.synertronixx>
	<20070503095759.GA552@aon.at>
Message-ID: <20070504073424.GA1982@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-05-03 11:57 +0200 schrieb Bernhard Fischer:

> A quick google for these keywords:
> __div0 raise arm softfloat

Well, one trace leads to an uClibc-gcc-41-raise-error.patch which yields
into a 404. But as I understand this "fixes" uClibc to compile but does
not change the toolchain itself.

Another trace yields into a discussion suggesting replacing u-boot's
__div(0) by a raise() stub. May be I did something like that with my
very ugly hack.

So did I understand right, that the libgcc calls raise() which is
provided by glibc not uClibc?

How comes only u-boot triggers that? I compiled many other stuff with
this toolchain, kernel and userspace leading into perfect working
binaries.

Kind regards, Konsti

-- 
synertronixx GmbH
Dipl.-Ing. (FH) Konstantin Kletschke
Vahrenwalder Str. 7
30165 Hannover
Tel.    : 0511 / 3574 - 661
Fax     : 0511 / 93 57 - 679
E-mail  : kletschke at synertronixx.de
Internet: http://www.synertronixx.de
Vertretungsberechtigte Gesch?ftsf?hrer:
Marc-Oliver Borck, Dr. Matthias Blaschke
Registergericht: Amtsgericht Hannover
Registernummer: HRB 59670
USt-ID: DE 216 559 901
