From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 14:30:54 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target
 install command
In-Reply-To: <b04bf76c-a3c4-1601-10c0-78ad61dffdc7@mind.be>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-3-anaumann@ultratronik.de>
 <20190314111311.48cda006@windsurf>
 <580bc2fc-615a-f200-0428-1096d2dcdf63@mind.be>
 <20190314120610.4ee82dd9@windsurf>
 <b04bf76c-a3c4-1601-10c0-78ad61dffdc7@mind.be>
Message-ID: <20190314143054.4974388a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Mar 2019 12:20:14 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >>  I disagree. I think the pattern of installing to staging and then copying to
> >> target is a good pattern.  
> > 
> > We basically don't use this pattern anywhere.  
> 
>  A quick grep gives me alsa-utils, dmalloc, libfuse, liblockfile, qt5*. So it is
> rare, but "don't use it anywhere" is an overstatement.

These are totally different: they copy an explicit list of files from
staging to target as their target installation logic. This is very
different from the more "systematic" approach of using files newer
than .stamp_built or using package-file-lists.txt that Andreas is
proposing.

So, I maintain that we don't use anywhere the pattern proposed by
Andreas at the moment, it is not an overstatement :-)

> > I would agree with the
> > general direction of killing the staging vs. target difference, and
> > simply produce "target" out of "staging" at the very end of the build,
> > but that's a huge undertaking.  
> 
>  So my point is: using this pattern for a few packages is a good step in that
> direction, because it teaches us something about the implications.

That is a very valid argument, indeed.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
