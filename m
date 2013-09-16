From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 19:58:46 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916170815.GB3293@free.fr>
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
Message-ID: <20130916195846.32e98c8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Sep 2013 19:08:15 +0200, Yann E. MORIN wrote:

> > but I'm wondering if the GPLv2 is the
> > right license for Buildroot. I believe it is not very easy to
> > understand how the terms of the GPL apply to something such as a
> > build system, and I am not sure that the GPL copyleft requirements
> > are really benefiting to Buildroot in any way. I am pretty sure
> > that the vast majority of companies using Buildroot are not really
> > realizing it's licensed under the GPL and therefore are not
> > complying with the Buildroot license terms (while they probably do
> > realize that the kernel, U-Boot, etc. are under the GPL and comply
> > with their terms).
> 
> On the other hand, the GPLv2 only applies at the time of distribution.
> So long as the Buildroot tre is not distributed, there is no reason to
> fear anything.

Right, that's true.

> Now, let's try to make things clear:
> 
>   - on an embedded system, the probability that there is a GPL program
>     is rather high (eg. busybox, the Linux kernel);
> 
>   - lets assume Buildroot is used to build those programs;
> 
>   - the GPL (as applied to _those_ programs, not Buildroot) mandates
>     that the script to control compilation and installation of those
>     programs be made available (section of GPLv2);

Whether Buildroot is part of such scripts or not remains a slightly
open question. That the kernel makefiles and scripts, the Busybox
makefiles and scripts should remain part of the kernel and Busybox
sources is clear. That the tool that is used to orchestrate the overall
building process is part of those "script to control compilation and
installation" is not so clear-cut from my point of view.

At least so far, I don't think I've seen many companies using
Buildroot, on products that include GPL components, providing the
source code for Buildroot.

>   - so the easiest way to comply with those programs' GPL is to
>     distribute the Buildroot tree that was used to build the target
>     filesystem, since it does contain all required recipes (aka the
>     scripts of section 3 of the GPLv2)

Right, but it is not necessarily easy to separate within Buildroot the
thing that you are ready to distribute (package recipes of open-source
programs) from the package recipes of proprietary programs, your root
filesystem overlay and so on.

>   - Buildroot is itself GPLv2, so by distributing the Buildroot tree,
> a company has to release it under GPLv2.

Yes, that's for sure, I'm not questioning that.

What I'm questioning is really the case where a company makes an
embedded product, and has used Buildroot to generate a rootfs that
includes GPL programs, is this company required to distribute Buildroot.

> > Of
> > course that's not an argument to change the license, but I believe
> > it also highlights how hard it is to understand the GPL
> > requirements on the Buildroot case.
> 
> Sorry, but it is very clear to me, and I am no lawyer. And any decent
> company will have a rather decent team of lawyers to help in these
> types of cases.

That might be the case where you work, but I honestly don't believe
it's the case in many companies, especially SMEs doing embedded
products.

> > So, I believe that we should either:
> > 
> >  (1) Clarify and document how we believe the GPL terms apply to
> >      Buildroot (this would probably be a long discussion process, in
> >      which the SFLC should probably participate). When I see the
> >      discussions around BR2_EXTERNAL where the package .mk files and
> >      Config.in files may be seen as derivative work, but not the
> > root filesystem overlay, or that package .mk files for GPL packages
> >      should be under the GPL,
> 
> It all revolves around the definition of a "derivative work".
> 
> We have to decide whether BR2_EXTERNAL is, or parts of it are, a
> derived work of Buildroot. I think you now know my position, I
> guess. ;-)

Right.

> >      but not necessarily .mk files for non-GPL
> >      packages,
> 
> Wrong. *If* they are distributed, they'll be under the GPLv2.
> But since they build proprietary (or weak-copyleft licensed) packages,
> it is _not_ required that they be distributed.

Yes, hence I said "not necessarily".

> >      I believe it is way too complicated for users. To me, it
> >      seems like complying with the Buildroot license is more
> >      complicated than using Buildroot itself, which is kind of
> > silly.
> 
> 
> >  (2) Change the Buildroot license to a non-copyleft license.
> 
> That would be a *hard* thing to do, I'm afraid.

Yes, license changes are difficult. Not impossible (VLC changed its
license, for example), but certainly annoying.

> I lean toward an explanation in the manual (with proper disclaimer
> that entice the user to seek legal counsel).

Fair enough. Care to submit a patch? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
