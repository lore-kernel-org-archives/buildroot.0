From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 16 Sep 2013 17:45:00 +0000
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
Message-ID: <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] On Behalf Of Yann E. MORIN
> Sent: Monday, September 16, 2013 12:08 PM
> 
> Thomas, All,
> 
> On 2013-09-16 18:21 +0200, Thomas Petazzoni spake thusly:
> > On Sun, 15 Sep 2013 00:16:13 +0200, Yann E. MORIN wrote:
> >
> > > Since Buildroot's license is the GPLv2, BR2_EXTERNAL is covered by the
> > > GPLv2.
> >
> > Probably going to make waves,
> 
> Probably, yes. ;-)
> 
> > but I'm wondering if the GPLv2 is the
> > right license for Buildroot. I believe it is not very easy to
> > understand how the terms of the GPL apply to something such as a build
> > system, and I am not sure that the GPL copyleft requirements are really
> > benefiting to Buildroot in any way. I am pretty sure that the vast
> > majority of companies using Buildroot are not really realizing it's
> > licensed under the GPL and therefore are not complying with the
> > Buildroot license terms (while they probably do realize that the
> > kernel, U-Boot, etc. are under the GPL and comply with their terms).
> 
> On the other hand, the GPLv2 only applies at the time of distribution.
> So long as the Buildroot tre is not distributed, there is no reason to
> fear anything.
> 
> Now, let's try to make things clear:
> 
>   - on an embedded system, the probability that there is a GPL program
>     is rather high (eg. busybox, the Linux kernel);

Not always.  There is still a high contingent in the States that use
VXWorks, and then a lesser population use a home-grown kernel without
every touching GPL code.


> 
>   - lets assume Buildroot is used to build those programs;
> 
>   - the GPL (as applied to _those_ programs, not Buildroot) mandates
>     that the script to control compilation and installation of those
>     programs be made available (section of GPLv2);
> 
>   - so the easiest way to comply with those programs' GPL is to
>     distribute the Buildroot tree that was used to build the target
>     filesystem, since it does contain all required recipes (aka the
>     scripts of section 3 of the GPLv2)
> 
>   - Buildroot is itself GPLv2, so by distributing the Buildroot tree, a
>     company has to release it under GPLv2.

I agree with Yann on this point.  I don't see a valid reason to change
the license of BuildRoot (even if you wanted to make it a less restrictive
license for the main package/*.mk files).  In my current company, I have
discussed in great detail exactly what must be done in order to comply
with the GPL.  The team I'm on has taken great care to isolate the code
into two sections:  Open Sourced code (including MIT license stuff, etc)
and IP code.  I have stressed the importance of carefully considering
how applications are made, what dependencies we have on the applications,
etc.  My company is on-board with (when we get to the point in which
we are shipping Linux as the OS on a product) releasing all the
non-company code.

I believe that, as Yann states below (more to comment on this), a company
acting in "good faith" has the desire to "do the right thing"(tm) ;).  I
would expect that the part that Thomas said is more likely the case.
People who are using BuildRoot may be breaking the license agreement
without intending to, nor without the knowledge they are doing so. In
keeping with his thought, I would support writing a fairly detailed
document (probably should even put a short "comment" in Kconfig about
it) to detail what we believe to be the "right thing".

> 
> > Of
> > course that's not an argument to change the license, but I believe it
> > also highlights how hard it is to understand the GPL requirements on
> > the Buildroot case.
> 
> Sorry, but it is very clear to me, and I am no lawyer. And any decent
> company will have a rather decent team of lawyers to help in these types
> of cases.

Don't assume to much on this one.  Though I have been in the Opened Source
community since 1993, I have seen many companies that didn?t have any
legal support on this.  In fact, I have seen SEVERAL law companies that,
though they are experts on licensing, etc, have never dealt with the GPL.

In the previous three companies that I worked for, there was hardly a
concern about licensing issues as the customer was the US army :\.  So,
we were careful, in those other companies, to package up all the open
sourced code, but we didn't really _do_ anything with it.

> 
> > So, I believe that we should either:
> >
> >  (1) Clarify and document how we believe the GPL terms apply to
> >      Buildroot (this would probably be a long discussion process, in
> >      which the SFLC should probably participate). When I see the
> >      discussions around BR2_EXTERNAL where the package .mk files and
> >      Config.in files may be seen as derivative work, but not the root
> >      filesystem overlay, or that package .mk files for GPL packages
> >      should be under the GPL,
> 
> It all revolves around the definition of a "derivative work".
> 
> We have to decide whether BR2_EXTERNAL is, or parts of it are, a derived
> work of Buildroot. I think you now know my position, I guess. ;-)

Well, In your e-mail (which predates this e-mail by a few minutes)
that starts out: 

	Andy, All,
	
	On 2013-09-16 15:43 +0000, ANDY KENNEDY spake thusly:

You have expounded on what you believe to a derived work.  What you stated
clearly in that e-mail was not the same meaning I derived from your former
e-mails.  I have no problem with your definition of a derived work, thus
I you and I are on the same side of this issue.

<snip>
<Crap!  snipped too much>

Yann, You stated that you would like to see further documentation that
clearly sets guidelines on this matter.  I stated this last week several
times, therefore I completely agree with you.

How ever we choose to license this, we should EXPLICITLY state this in
documentation and CLEARLY show where this document is.  If it comes down
to a vote of current developers, I would like to even put that into the
document, perhaps with a  S H O R T  comment as to the viewpoint of the
voter ;) so that in 10 years there is no confusion about our points of
view to the next generation of BuildRoot users and developers.

Andy
