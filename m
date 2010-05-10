From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 May 2010 22:20:19 +0200
Subject: [Buildroot] [git commit master] libxcb: fix path to Python
	modules
In-Reply-To: <AANLkTiknUv3xy6Diwkz2xtOxwckUCAKuajGodk8OsxAa@mail.gmail.com>
	(Paulius Zaleckas's message of "Mon, 10 May 2010 15:33:47 +0300")
References: <20100507223516.527CB8F341@busybox.osuosl.org>
	<AANLkTiknUv3xy6Diwkz2xtOxwckUCAKuajGodk8OsxAa@mail.gmail.com>
Message-ID: <87ljbr4igs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 >> Therefore, add a little bit of magic to compute the host Python
 >> version.

 Paulius> Unfortunately this fails on my system:
 Paulius> $ python --version
 Paulius> Python 2.6
 Paulius> $ python --version | sed 's/Python \(2\.[0-9]\)\..*/\1/'
 Paulius> Python 2.6

Ahh, then we better do 's/Python \(2\.[^\.]\).*/\1/' instead, or even
better:

's/Python \([0-9]\.[^\.]\).*/\1/'

Will fix.

-- 
Bye, Peter Korsgaard
