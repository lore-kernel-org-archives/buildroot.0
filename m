From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 09:15:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-25
In-Reply-To: <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
References: <20180426060013.EAB262079F@mail.bootlin.com>
 <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
Message-ID: <20180430091509.3a9cdff2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Apr 2018 00:15:18 +0200, Romain Naour wrote:

> > Detail of failures
> > ------------------
> > 
> > microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 |     
> > microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b |       
> 
> I tried to reproduce this issue with the upcoming gcc 8.1 for microblaze but
> flare-engire build fine with it.
> 
> git bisect helped to find a patch [1] fixing an infinite loop in RTL DSE
> optimizer. Also, back porting the patch to gcc 7.3.0 fix the issue.
> 
> Since this patch is not specific to microblaze, but in gcc's code, I'm not sure
> what we need to do.
> Either back port the patch to affected gcc version and take the risk to break
> something with other architecture or optimization level.
> Or add BR2_TOOLCHAIN_HAS_GCC_BUG_85180 option and wait for gcc 8.
> 
> Maybe it's easier to add an autobuilder exception for boost and flare-engine on
> microblaze?
> 
> It's not clear if other architecture can be affected.
> 
> Thoughts?

First of all, thanks for this investigation!

I believe we need to report this to upstream gcc (i.e that gcc 7.x is
affected) and see if they backport to the gcc 7.x branch. If they do,
then the solution is simple: also backport the patch on our side, until
they do a new 7.x release.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
