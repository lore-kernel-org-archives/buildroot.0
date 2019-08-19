From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 23:32:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
Message-ID: <20190819233256.01c0f4a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Aug 2019 23:28:09 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Yes, this is a limitation of how we work right now. I'm not sure how to
> > handle this exactly at this point.
> > 
> > Should the results of http://autobuild.buildroot.net/stats/ and
> > http://autobuild.buildroot.net/stats/index.json use the next branch
> > when available ?
> > 
> > Having a look at the state of the master branch in terms of missing
> > version updates could also be helpful to detect packages for which
> > we're missing security updates.  
> 
>  Not really, since we only show the highest release, so not anything from stable
> branches. And we can assume that the version on next is >= the version on master.

"we only show the highest release" -> release-monitoring.org doesn't
have the notion of "stable branches" from upstream or anything like
that. It even considers -rc versions to be more recent than a regular
official release.

But I see your point that anyway release-monitoring.org is only very
partially helping to track whether we need to update for security
reasons. A CVE-related tracking tool (such as what Matt Weber was
working on back then) would be better suited for this task.

If you agree with this, then perhaps the autobuild.b.o/stats/ page, and
the corresponding JSON output, should be generated based on the next
branch rather than the master branch.

Should I go ahead and make the change ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
