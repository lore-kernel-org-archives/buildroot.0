From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 07:47:40 +0200
Subject: [Buildroot] [RFC] Effective Patchwork Use and Patch Review
In-Reply-To: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
References: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
Message-ID: <20130914074740.424283aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 13 Sep 2013 11:41:41 -0500, Ryan Barnett wrote:

> One thing that I've found difficult is finding an effective way for
> someone new to buildroot community to perform reviews on patches they
> find of interest. What I mean by effective is a way that takes little
> time to pull the patch down and then mark it up for review and send it
> back out. Our email client in my work environment isn't ideal.
> However, we do have ways of sending email directly using git-email.
> 
> The thing is that I haven't been able find good documentation on how
> to effectively use Patchworks for review (pwclient). I don't
> necessarily need someone to tell me how to exactly use it but rather
> maybe an example workflow for interacting with patchworks with
> "pwclient" and maybe some example helper scripts for formatting
> replies to these patches.

patchwork is really not here to help with the reviewing process. It's
mainly of use for the Buildroot maintainer to keep track of which
patches remain to be merged/rejected.

All the reviewing process takes place on the mailing list, using e-mail
clients. We don't use patchwork at all for this.

The only use of patchwork you may be interested in is to apply patches
locally in order to be able to test them. But you don't even need
pwclient for that. You can simply do:

wget -O - http://patchwork.ozlabs.org/patch/274867/mbox/ | git am

This will fetch a patch from patchwork and apply it to the current
branch.

But besides that, all the review process simply consists in replying to
the patch on the mailing list.

> So I guess the two things that I would like to see eventually be
> addressed by provide a little more detail some how are:
> 
> 1) Guidelines for providing reviews comments on patches

As said above, it's really just "hit reply in your mailer", and provide
your comments at the relevant places in the patch itself.

> 2) Some examples of how to effectively use patchworks for reviewing

patchwork is of little use for reviewing. The only thing it is used for
is to know the list of patches that are still pending to be applied.

I believe you might have seen patchwork like gerrit, but it is not:
patchwork is really a patch tracking tool, not a patch reviewing tool.
At the time we introduced patchwork, I believe we discussed gerrit and
things like that, but if I remember correctly, we thought that
patchwork was already a good step forward, and we didn't want to move
to a more complicated tool in one step.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
