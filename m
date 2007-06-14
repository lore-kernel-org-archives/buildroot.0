From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Thu, 14 Jun 2007 09:50:18 +0200
Subject: [Buildroot] uclibc.mk breaks target .config
In-Reply-To: <20070613181601.GB4847@aon.at>
References: <20070613124624.GA10380@z1.synertronixx>
	<20070613134054.GA28888@aon.at>
	<20070613135634.GA6911@z1.synertronixx>
	<20070613181601.GB4847@aon.at>
Message-ID: <20070614075017.GB1833@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-13 20:16 +0200 schrieb Bernhard Fischer:

> >Well, there is mentioned to make a "make uclibc-menuconfig" but I need
> >to supply one by myself.
> 
> This is ment to help to create your personal uClibc.config

Okay, so its only a helper, I did not realize yet I could utilize it so
I created a .config always in a separate uClibc tree. Me stupid...

> I assume that you buildroot config just clashes with your "custom"
> uClibc.config. The ABI has to come from buildroot since it is also used

Well, the ABI is EABI in buildroot .config also and the uclibc.mk is
therefore echoing CONFIG_ARM_EABI=y into
toolchain_build_arm/uClibc/.config. But at the buttom of the file
among other echoed lines it confuses uClibc's make oldconfig.

> >Oh sorry! My question was intended to be only a question, not a rant at
> 
> ack.

I will never rant to or about free software, I use buildroot very often
and it is a very good help makeing life easier :-)

> no, that's really wrong. See above.

Okay, I will poke around a bit eith this :)

Regards, Konsti

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
