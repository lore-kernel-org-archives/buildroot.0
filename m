From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 08:23:04 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be> (Arnout
 Vandecappelle's message of "Tue, 28 Jun 2016 00:50:30 +0200")
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
 <20160627223936.GD3714@free.fr>
 <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be>
Message-ID: <87lh1pq1br.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Well, any two projects would have different workflows, so suggesting a
 >> "realistic project" uses an automated override-srcdir is just pushing
 >> the limits too much, IMHO.

 >  Of course. But it's true that the same workflows are covered by
 > _OVERRIDE_SRCDIR and _CUSTOM_LOCAL.

Yes, except that _CUSTOM_LOCAL ends up in the .config, so it easily gets
committed to version version control, whereas you have to go out of your
way to shoot yourself in the foot with _OVERRIDE_SRCDIR.

 >> 
 >> Besides, my opinion is that having the sources for packages in the
 >> br2-external tree is bad, and that each package should have its own
 >> git/hg/svn/bzr tree. But that varies between projects! ;-)

 >  They are git submodules, of course.

 >  In my experience referring to tags or shas from a defconfig is really clunky,
 > it makes updating extremely inflexible. I've implemented scripts to automate the
 > tagging for some projects; in the end they didn't use it, because the submodule
 > tag already covers it.

What is the problem with referring to shas from the defconfig? That
sounds to me to be no more work than changing the submodule version. Or
are you just referring to the effort to tag the individual components
for a release?

-- 
Venlig hilsen,
Peter Korsgaard 
