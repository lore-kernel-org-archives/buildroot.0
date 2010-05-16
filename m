From: Chris Kerios <ckerios@gmail.com>
Date: Sun, 16 May 2010 17:29:16 -0400
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
In-Reply-To: <87bpcf3a6w.fsf@macbook.be.48ers.dk>
References: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
	<58B9D5B09E114795948B69CA62CAB0CE@AP366>
	<AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
	<87bpcf3a6w.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTil700dIJdHHJ8md_AlfjpSO1BtLeI-CWcX2oHki@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Peter.
Yes, I am building fine now on the Geode.  The build is configured with all
the latest versions of the software for uClibc, busybox and kernels.  I also
have a AVR32 NGW100 that I am beginning to work on that I will be testing
buildroot on next.  I will let eveyone know how that one goes and cry for
help when I get lost in buildroot...haha.

Regarding the JFFS2 and MTD utilities.  I just learned online this week that
none of it applies to working with a CompactFlash card, so thanks for
reinforcing that piece of knowledge for me.  One less thing to worry about.
What I was wondering about was since I have this configuration Geode
w/Compact Flash.  What does the embedded community recommend be used as a
file system, ext2/3 or something else.  Although we will run most of the
system and application in RAM we want our application to write some data to
disk (Compact Flash) and back across the network in the event of failures,
etc.  We also are going to be running in a relatively "high availability"
environment so I am concerned about the long term operation of the CF over
time.  Does anyone have any thoughts on this?  I know this isn't the right
mail list for this type of question but I know the world of embedded
developers out there are using this tool extensively so you all obviously
have thoughts and opinions on this.

Great tool!  Thanks,
Chris

On Sun, May 16, 2010 at 3:42 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Chris" == Chris Kerios <ckerios@gmail.com> writes:
>
>  Chris> Thanks Will.
>
>  Chris> Sorry, my bad everyone, I didn't look far enough down in the
>  Chris> mail archive to see your thread where this is resolved with a
>  Chris> config file change.  I blew away my .config file and rebuilt a
>  Chris> new one and all the problems with usleep and the uClibc build
>  Chris> went away.
>
> Ok, so the problem was that you used the uclibc 0.9.30 config with
> uclibc 0.9.31.
>
>  Chris> However, what did blow up was the MTD utilities build.  I am
>  Chris> researching that right now.  I thought I saw something in the
>  Chris> mail archive but it looked like it was just saying to turn it
>  Chris> off for the time being.  If this is the case I am not sure if
>  Chris> that is going to work for me as I am developing on a compact
>  Chris> flash card and using JFFS2 for a file system.  Still learning.
>  Chris> Thanks.
>
> JFFS2 on compact flash? That doesn't sound right. JFFS2 is meant to be
> used on raw flash, not on
> flash-with-a-microcontroller-pretending-to-be-a-disk like a compact
> flash card is.
>
> The mails about mtd problems was with the new busybox applets, not the
> normal mtd package.
>
> Please send some more info if you still have problems building it
> (busybox .config, exact error message).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100516/4923f8f3/attachment.htm>
