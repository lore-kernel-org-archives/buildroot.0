From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Feb 2016 22:40:26 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
	licensing
In-Reply-To: <20160204220857.7abb7d07@free-electrons.com>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
 <20160203230208.GB3428@free.fr> <56B293F2.9070201@mind.be>
 <20160204204224.GA3468@free.fr>
 <20160204220857.7abb7d07@free-electrons.com>
Message-ID: <20160204214026.GC3468@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-02-04 22:08 +0100, Thomas Petazzoni spake thusly:
> On Thu, 4 Feb 2016 21:42:24 +0100, Yann E. MORIN wrote:
> > Not really. It is implicitly addressed, since the above states:
> > 
> >     [The patches] are provided under the same license as the software
> >     they apply to.
> > 
> > So, if someone has a proprietary license for a package *we* only can get
> > under an Open Source license, that someone would potentially be tricked
> > into believing that the patches we carry are under the license he was
> > provided that package under. Which is not really true, see below...
> > 
> > There are only two options:
> > 
> > 
> >  1) Our patches are available under the same license as the package they
> >     apply to is publicly and commonly available under.
> > 
> >     This basically means the patches can't be applied to a proprietary-
> >     licensed package when it is only publicly and commonly available
> >     under a Free (aka GPL-like) license. However, for an Open Source
> >     (aka BSD-like) license, they might still be useable on a proprietary-
> 
> The BSD license is both a Free Software license and an Open Source
> Software license. The GPL is both a Free Software license and an Open
> Source Software license.
> 
> I think you wanted to make the distinction between copyleft licenses
> and non-copyleft licenses, which has rigorously *nothing* to do in the
> Free vs. Open debate.

Yep. I spent three hours hashing that mail out, and I still made a
mistake on that part. Sigh... :-/

Thanks for correcting me on this. :-)

> >  2) Our patches are available under a license that allows them to still
> >     be applied even if the recipient of the package they modify has been
> >     granted different licensing terms (aka proprietary) than the ones
> >     that package is publicly and commonly available under.
> > 
> >     This means that part of the software we write is no longer Free (as
> >     from a GPL-sided point-of-view), basically this is a blank check for
> >     including them in proprietary software.
> > 
> >     Furthermore, we can not know all the proprietary licenses each such
> >     package may be available under, by the mere fact that such licenses
> >     may not be publicly known. In most, if not all jurisdiction, one can
> >     not be bound by terms one does not have knowledge of. I.e. if we
> >     wanted our patches to be useable under those licenses, then we would
> >     have to provide our patches under a *very* liberal license, probably
> >     just the Public Domain, as any license, even the most liberal ones
> >     like the WTFPL, may have terms that contradicts terms of such a
> >     proprietary license (which we have no detail for).
> > 
> >     Finally, this can not apply to our existing patches, as we can not
> >     assume that the original submitters of those patches would have
> >     expected they be made available under any license beside the license
> >     under which the package is publicly and commonly available.  I.e.
> >     we're anyway screwed with existing patches.
> 
> Not to mention the fact that we often re-use patches from other
> projects: from the upstream project, from OpenEmbedded, OpenWRT, Alpine
> Linux, and others.

Damn, three hours later, and I even missed that one...

> The Yocto Project documentation says "Patches to the Yocto Project
> follow the upstream licensing
> scheme." (http://www.yoctoproject.org/docs/1.8/dev-manual/dev-manual.html).
> Not super clear.

Nope, that's not pretty clear, but I'm not too surprised. These are
tricky matters, and it is very easy to fall through the cracks...

> > We *really* need to sort out this situation, so that we all agree on
> > what the license for our patches are. Needless to say that I will
> > strongly advocate that we settle on the first solution.
> 
> I don't think we have any other solution but to release them only under
> the publicly available open-source license. As you put it, we do not
> even know the terms of the Qt or MySQL commercial licenses, so we can
> hardly release code under those licenses.

Not counting that there might not be a single proprietary license for a
pcakge. Terms may very well vary from one licensee to another, depending
on a lot of factors we do not even know (like the phase of the Moon).

> So I'd say we should restrict ourselves to the open-source license of
> the publicly available versions. Those who use the commercial variant
> of those packages are on their own, and if they are using a commercial
> variant, they should have access to support from their vendor.

ACK.

So, what about the following:

    Buildroot comes with its own license, reproduced below.

    Buildroot also bundles patch files, which are applied to the sources
    of the various packages. Those patches are not covered by the license
    of Buildroot, but are provided under the same license as the software
    they apply to is publicly and commonly available under. Run 'make
    legal-info' to collect the licenses of your selected packages and
    their patches.

as a preamble to the COPYING file?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
