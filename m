From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 16 Sep 2013 18:56:25 +0000
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916202439.50de3e76@skate>
References: <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate>	<52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr>	<523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr>	<20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>	<20130916195846.32e98c8a@skate>
 <20130916181512.GD3293@free.fr> <20130916202439.50de3e76@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639ACE36E@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> 
> Dear Yann E. MORIN,
> 
> On Mon, 16 Sep 2013 20:15:12 +0200, Yann E. MORIN wrote:
> 
> > > Whether Buildroot is part of such scripts or not remains a slightly
> > > open question. That the kernel makefiles and scripts, the Busybox
> > > makefiles and scripts should remain part of the kernel and Busybox
> > > sources is clear. That the tool that is used to orchestrate the overall
> > > building process is part of those "script to control compilation and
> > > installation" is not so clear-cut from my point of view.
> > >
> > > At least so far, I don't think I've seen many companies using
> > > Buildroot, on products that include GPL components, providing the
> > > source code for Buildroot.
> >
> > I never said you *had* to provide the Buildroot tree. I said that
> > providing it was *easier* than trying to separately provide build
> > instructions for each GPL program on the device.
> 
> Right. But are there any companies doing any of above? I don't think
> I've ever seen a document, or script, or anything like that that
> details the build process of the overall system.
> 
> I remain unsure that what Buildroot is doing is part of the scripts
> governing the compilation of the GPL components.

By reading the original license of Buildroot, I find that the license
does imply that one must provide the BR source tree too.  Though,
I am speaking without the aide of any council on my side.

> 
> > > Right, but it is not necessarily easy to separate within Buildroot the
> > > thing that you are ready to distribute (package recipes of open-source
> > > programs) from the package recipes of proprietary programs, your root
> > > filesystem overlay and so on.
> >
> > But your BR2_EXTERNAL will make this really trivial:
> >   - do all FLOSS stuff in Buildroot tree
> >   - do all proprietary stuff in BR2_EXTERNAL
> >   - provide the Buidlroot tree to be compliant
> >   - keep BR2_EXTERNAL private
> >
> > Et voil?! :-)
> 
> What a good selling argument for BR2_EXTERNAL :-)
> 
> But it isn't quite sufficient: by your definition, the
> Buildroot .config should also be shipped, and it also contains config
> options for the company-specific proprietary packages. So the .config
> should be "filtered" before being released. Not simple.

Hmmm, almost sounds like there should be a separate $(MAKE) -C into the
BR2_EXTERNAL directory for menuconfig.  Then, if BR2_EXTERNAL is set,
parse the file $(BR2_EXTERNAL)/.config as a separate entity.

> 
> > > What I'm questioning is really the case where a company makes an
> > > embedded product, and has used Buildroot to generate a rootfs that
> > > includes GPL programs, is this company required to distribute Buildroot.
> >
> > Short answer: no.
> > Long answer: no, but it is an easy path.
> 
> Aren't companies going to be afraid of revealing too much of their
> secret sauce if they have to disclose their Buildroot tree?
> 
> My point is also that nobody has ever cared about enforcing the
> Buildroot license, and I sincerely doubt anyone will be willing to do
> in the foreseeable future. Since no-one cares about that, is it really
> necessary to annoy companies with the fairly fuzzy requirements of the
> GPL when applied to a build system?

In this case, could we not provide the license to mean something like:

BuildRoot is  provided as a  convenience to companies / individuals that
desire  to build an embedded GNU / Linux system for personal pleasure or
for financial gain.   Though BuildRoot  is licensed under the GPLv2, the
intent of the licenser is to protect the developers of the code from any
third party wishing to seek  legal action in the event of harm done to a
system by the use/misuse of BuildRoot.  Also, the desire of the licenser
is to grant access of the  BuildRoot build system to  use in the  manner
that is most beneficial to the licensee. The expectation of the licensee
is that  you  will  provide the BuildRoot build  system  for all  binary
kernels, root file systems, and any  other GPL code  that you build with
your  binaries as the  "build scripts"  for the related  GPL code.   The
licenser does not desire to seek legal action for the use in any form of
the BuildRoot build system, but asks only that those companies/individu-
als that use BuildRoot to make financial gain respect the  community and
help us to make  BuildRoot better.   If you believe  that BuildRoot is a
build system that can assist you, please PUSH BACK YOUR  IMPROVEMENTS TO
BUILDROOT!!

> 
> > We just have to settle on what we want to put in there: BR2_EXTERNAL:
> > derived work or not? ;-)
> 
> If it's considered as a derived work, then your above idea of using
> BR2_EXTERNAL to split things between secret stuff and released stuff no
> longer works.
> 
> > But not before next week, I have to finish my presentations for KR`13
> > first! ;-)
> 
> Argh, I should do that too!

Yeah, ya'll have fun with that :(.  There is no way for me to attend such
a function (lack of funds, wife, three kids with one on the way, etc).

Andy
