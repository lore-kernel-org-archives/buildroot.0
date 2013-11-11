From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Mon, 11 Nov 2013 07:53:45 -0600
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <20131110111811.GM26440@lukather>
References: <1464774.i3ScgRtXEf@sagittae>
 <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
 <1649802.VKqnEsp2qV@sagittae>
 <OF5D58F4C2.77D4F569-ON86257C1D.005A57B4-86257C1D.006BA51B@rockwellcollins.com>
 <20131110111811.GM26440@lukather>
Message-ID: <OF369F6B03.EB7DD954-ON86257C20.004B4554-86257C20.004C5528@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Ripard <maxime.ripard@free-electrons.com> wrote on 11/10/2013 
05:18:11 AM:

> From: Maxime Ripard <maxime.ripard@free-electrons.com>
> To: Matthew Weber <mlweber1@rockwellcollins.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>, buildroot at busybox.net
> Date: 11/10/2013 05:20 AM
> Subject: Re: [Buildroot] [RFC] Continuous integration
> 
> Hi Matthew,
> 
> On Fri, Nov 08, 2013 at 01:35:46PM -0600, Matthew Weber wrote:
> > We might have a fourth semi-continuous integration scenario that 
prevents 
> > server thrashing at each check-in. 
> > - We run the script every night processing the current GIT tip at that 

> > time. 
> > - We clean each of the full cfg builds and let the script do a 
complete 
> > re-build.  (We do this because the individual pkg  cleans aren't 
> > guaranteed 
> > to cleanup the pkg installs)
> > - Once all jobs complete we terminate the script and eventually will 
send
> > the report with status.
> > (I'll clean-up what I changed and get it committed.  Would you be up 
for 
> > optional runtime config options?  One might be to enable continuous 
> > or a one-stop script execution.)
> 
> It's pretty much what I've setup here already:
> http://jenkins.free-electrons.com/job/buildroot/
> 
> It runs every night and start a clean build of all the configuration
> we have if a new commit has been merged.
> 
> The only thing missing here is that the emails get only send to Peter,
> Thomas P. and I because I didn't want to spam the list, but this can
> easily be changed.
> 
Cool, good to know that the default set of defconfigs is being validated 
against
the current tip.
I think the scenario we're trying to target is validating offline/internal 

board targets for different custom products.  We don't necessarily want 
the builds
to catch every commit (limited on build server resources), but just give 
us granular
enough feedback to know roughly which commit caused a new issue. 
We evaluated buildbot and Jenkins and had been debating about just doing a 

simple script like what J?r?me has done.  So when we saw what he had 
started it 
looked like a good opportunity to give it a try.  Currently we have it 
setup for
a nightly validation of a few defconfigs. 
For a continuous integration, I do agree Jenkins is a very good option.

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com

> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> [attachment "signature.asc" deleted by Matthew L Weber/CedarRapids/
> RockwellCollins] 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131111/89080467/attachment.html>
