From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Oct 2015 12:46:40 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
	internal toolchain
In-Reply-To: <561E18C7.5090201@mind.be> (Arnout Vandecappelle's message of
 "Wed, 14 Oct 2015 10:56:39 +0200")
References: <20151011120859.7e786a73@free-electrons.com>
 <561AC198.9070206@mind.be> <561E18C7.5090201@mind.be>
Message-ID: <87a8rl917z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> One solution for both issues would be to deal with buildroot-built toolchains
 >> explicitly in the toolchain wrapper, i.e. detect the existence of .real and exec
 >> that one directly. Would that be an acceptable solution?

 >  Since this solution will be a lot easier, and we probably want it anyway for
 > the ccache and arch-options issue, I will go for this solution.

 >  The question is then: do we detect the existence of .real at runtime in the
 > wrapper itself, or when building the toolchain wrapper?

I would personally prefer to keep the wrapper as simple as possible (and
errors to show up at build time and not runtime), so I would prefer to
do it when building the wrapper.

 >  I'll try to find time this evening to work this out.

Great, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
