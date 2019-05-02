From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 02 May 2019 11:37:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/mfgtools: bump to version 1.2.91
In-Reply-To: <15946_1556784081_5CCAA3D1_15946_377_1_20190502080119.GA3431@r-lnx-nyma7486-2>
References: <20190430201121.15634-1-joerg.krause@embedded.rocks>
 <20190430201121.15634-2-joerg.krause@embedded.rocks>
 <880fdc14-d19f-020b-9735-9e0077e6be76@mind.be>
 <7552b9cbd58edcd667f52531ed75e3fe57cd705c.camel@embedded.rocks>
 <4bf9c494-f6dc-e1a8-abad-3d87cbf1e051@mind.be>
 <15946_1556784081_5CCAA3D1_15946_377_1_20190502080119.GA3431@r-lnx-nyma7486-2>
Message-ID: <21d05d87384f2f839a4a053cf7701c803bdd7a38.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2019-05-02 at 10:01 +0200, yann.morin at orange.com wrote:
> Arnout, All,
> 
> On 2019-05-02 09:52 +0200, Arnout Vandecappelle spake thusly:
> > On 02/05/2019 08:51, J?rg Krause wrote:
> > > > > The
> > > > > problem is, that git provides the version information of Buildroot.
> > > >  Is it that much of a problem if the Buildroot version is used?
> > > mfgtools saves the version string in generated runtime scripts. So this
> > > is a problem.
> > 
> >  Yes, I understand that. But the effect is that `uuu --version` will print
> > 2019.02 instead of 1.2.91, right? So my question is: is it that much of a
> > problem that this happens?
> > 
> >  I'm asking because I'm sure there are other packages that have that behaviour.
> > Are we going to try to find and fix all of them? Or just live with the fact that
> > some packages report the wrong version?
> 
> I think the real issue is that, for out-of-tree builds, there might be
> no git tree available, and thus those packages would FTBFS. This means
> we would eventually cactch such packages.

That's correct for mfgtools for example. When building with Buildroot
extracted from the tarball it will not compile as it misses
gitversion.h. This issue has been reported upstream.

> Furthermore, it would be pretty surprising for unsuspecting users to end
> up with Buildroot's version instead of that package's version.
> 
> As such, your proposal to replace the version script is good idea.

I agree!

Best regards
J?rg Krause
