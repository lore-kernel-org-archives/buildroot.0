From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 18:12:06 +0200
Subject: [Buildroot] [PATCH 1/2] package: instrument to gather timing
	data
In-Reply-To: <CAAXf6LXtCXk4c83xZK9os2Px9+Y2LzGnFxBt6h4puNEx-8F3dA@mail.gmail.com>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <201110110759.23066.arnout@mind.be>
 <CAAXf6LXtCXk4c83xZK9os2Px9+Y2LzGnFxBt6h4puNEx-8F3dA@mail.gmail.com>
Message-ID: <201110111812.06508.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 11 October 2011 10:29:13, Thomas De Schampheleire wrote:
> >> and the build-time.data is
> >> never removed, so results will accumulate if several partial builds
> >> are done.
> > 
> > I would call that a feature :-) Partial builds typically mean that you're
> > hacking away at some package, and then it's very relevant to see the
> > impact on build time.
> 
> How would you see the impact? Wouldn't it be more useful to save the
> timing data for subsequent runs in different files (e.g. timestamped
> files) so that you can compare such runs?
> If you let the data accumulate, you'd get one big number for each
> step/package combination, unless you're going to update the parser
> script to display the different data lines as separate entities, one
> for each run).

 I hadn't read the parser script, I assumed it would just generate a different 
bar for each run.  Now I see it would only work in pie-steps mode.

 BTW, histogram is a wrong name.  A histogram would for instance indicate how 
many packages have a build time between 1 and 2 seconds.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111011/6c5aa6d8/attachment.html>
