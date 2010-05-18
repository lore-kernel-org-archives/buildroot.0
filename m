From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 May 2010 12:21:23 +0200
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
In-Reply-To: <AANLkTil700dIJdHHJ8md_AlfjpSO1BtLeI-CWcX2oHki@mail.gmail.com>
	(Chris Kerios's message of "Sun, 16 May 2010 17:29:16 -0400")
References: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
	<58B9D5B09E114795948B69CA62CAB0CE@AP366>
	<AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
	<87bpcf3a6w.fsf@macbook.be.48ers.dk>
	<AANLkTil700dIJdHHJ8md_AlfjpSO1BtLeI-CWcX2oHki@mail.gmail.com>
Message-ID: <87bpcdzf18.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Kerios <ckerios@gmail.com> writes:

 Chris> Thanks Peter.

 Chris> I also have a AVR32 NGW100 that I am beginning to work on that I
 Chris> will be testing buildroot on next.? I will let eveyone know how
 Chris> that one goes and cry for help when I get lost in
 Chris> buildroot...haha.

;)

 Chris> Regarding the JFFS2 and MTD utilities.? I just learned online
 Chris> this week that none of it applies to working with a CompactFlash
 Chris> card, so thanks for reinforcing that piece of knowledge for me.?
 Chris> One less thing to worry about.? What I was wondering about was
 Chris> since I have this configuration Geode w/Compact Flash.? What
 Chris> does the embedded community recommend be used as a file system,
 Chris> ext2/3 or something else.

EXT2 - The journal updates from EXT3/4 are bad for the lifetime of the
CF.

And make sure you mount it noatime to limit writes.

-- 
Bye, Peter Korsgaard
