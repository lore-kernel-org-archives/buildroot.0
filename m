From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 May 2010 21:42:31 +0200
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
In-Reply-To: <AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
	(Chris Kerios's message of "Wed, 12 May 2010 14:05:37 -0400")
References: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
	<58B9D5B09E114795948B69CA62CAB0CE@AP366>
	<AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
Message-ID: <87bpcf3a6w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Kerios <ckerios@gmail.com> writes:

 Chris> Thanks Will.

 Chris> Sorry, my bad everyone, I didn't look far enough down in the
 Chris> mail archive to see your thread where this is resolved with a
 Chris> config file change.? I blew away my .config file and rebuilt a
 Chris> new one and all the problems with usleep and the uClibc build
 Chris> went away.

Ok, so the problem was that you used the uclibc 0.9.30 config with
uclibc 0.9.31.

 Chris> However, what did blow up was the MTD utilities build.? I am
 Chris> researching that right now.? I thought I saw something in the
 Chris> mail archive but it looked like it was just saying to turn it
 Chris> off for the time being.? If this is the case I am not sure if
 Chris> that is going to work for me as I am developing on a compact
 Chris> flash card and using JFFS2 for a file system.? Still learning.?
 Chris> Thanks.

JFFS2 on compact flash? That doesn't sound right. JFFS2 is meant to be
used on raw flash, not on
flash-with-a-microcontroller-pretending-to-be-a-disk like a compact
flash card is.

The mails about mtd problems was with the new busybox applets, not the
normal mtd package.

Please send some more info if you still have problems building it
(busybox .config, exact error message).

-- 
Bye, Peter Korsgaard
