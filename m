From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 12 Sep 2013 22:28:08 +0000
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130912220757.GD3362@free.fr>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <20130912220757.GD3362@free.fr>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AC9248@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Yann E. MORIN wrote:
> IANAL, this is not legal advice, talk to your lawyer.
> 
> Here are however my toughts on this:
> 
>  1- all the Config.in and package.mk files, plus the external.mk file,
>     and all other files sourced or otherwise included by a file from
>     Buildroot (and thus use Buildroot's infrastructure) could be
>     considered a derived work of Buildroot, and thus must be licensed
>     with a compatible license,
>  2- the defconfigs could be considered as what the GPL identifies as the
>     "scripts used to control compilation and installation of the
>     executable", since without the .config file, an end-user can not
>     reproduce the executable(s),
>  3- everything else might be considered not a derived work of Buildroot,
>     and might not be required to be licensed with a license compatible
>     with Buildroot's license.
> 
> Explanations:
> 
> 1- It's not because it is to be licensed under a license compatible with
>    the Buildroot  license that it *has* to be distributed. Just that if
>    it *is* distributed, the licensing terms on that should be compatible
>    with Buildroot's licensing terms.
> 
> 2- That's because Buildroot will most probably build a GPL/LGPL program
>    that will end up in the ytarget that this applies, because of the
>    license of those programs, not because of Buildroot's license. Even
>    if Buildroot was under a different license, this would still apply as
>    long as a GPL/LGPL program ends up in the target.
> 
> 3- By "everything else", I mean: a package (in Buildroot's terminology:
>    the Config.in and associated .mk file) that directly embbeds the source
>    files (.c and .h and ...) for this package (like the host-mkpasswd).
>    These source files can not be considered a derived work of Buildroot,
>    so Buildroot's license does not apply to those.
> 
> So, I think the make legal-stuff should descend into BR2_EXTERNAL, as if
> it was an integral part of Buildroot.
> 
> BR2_EXTERNAL is here *just* to separate parts of the recipes from the
> upstream ones, as a mean to clearly separate local changes from the
> upstream reference.
> 
> But again: IANAL, this is not legal advice, talk to your legal counsel.


Since tone is difficult to understand through e-mail, please understand
that I'm not attempting to start a flame war, nor am I throwing stones. . .
just brainstorming (or in my case, perhaps a light shower).

You speak of BuildRoot as a third party.  BuildRoot is not really a third
party but is first person from my point of view.  Although I have not added
NEAR as much as other people, I still contend that I am partial owner in
BuildRoot.  To that end, I have a voice in the decision making over any
external (or internal for that matter) infrastructure and/or tie-in.

If we choose to allow outside companies to use BuildRoot to develop systems
with Intellectual Property (IP) -- which is why we all contribute to
BuildRoot in the first place right?  I mean, surely I'm not the only one
here who has paid for my house, cars, kids, etc by using Linux (and by
extension BuildRoot) to develop embedded systems. -- then we are here-by
GRANTING permissions, as the current developers of BuildRoot, that Sure
"Super Company XYZ" you can use our previous work to go forth and make
Linux products.  IMO, the more users we have of Open Sourced software, the
better the software becomes.  Just because I push something back to the
community doesn't mean that I have given away some sort of trade secrete.
How I use the widget may be the trade secret, but that is none of anyone
else's business (and EXCEEDS the scope of the GPL).

So, can we not attempt to come to a consensus within our own little
BuildRoot family of how we will allow others to use such a tie-in?  If the
general populous of this family decides that we want to protect what we
have done, so be it.  But, if most of us feels that we should allow
companies/individuals to expand what is built with BuildRoot without the
fear of the FSF coming to hunt down all their children, then we should, as
the property holders, grant that permission EXPLICITLY.

Again, If I'm the only one that feels this way, tell me to shut up and I'll
say nothing else about it.  I just don't think that using Linus's kernel
under the hood, and the GNU project's additions to it requires the developers
of a product to "open source" the product just because they are, within the
confines of the granted licenses, and within GOOD FAITH of the company and
free software community, using said base.

Andy
