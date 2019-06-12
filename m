From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 12 Jun 2019 18:41:02 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <20190612155844.GC2647@scaer>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
 <20190611081559.GA24465@t450s.lan>
 <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
 <20190612155844.GC2647@scaer>
Message-ID: <20190612164102.GA6917@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Jun 12, 2019 at 05:58:44PM +0200, Yann E. MORIN wrote:
> Arnout, Gary, All,
> 
> On 2019-06-11 11:52 +0200, Arnout Vandecappelle spake thusly:
> > On 11/06/2019 10:15, Gary Bisson wrote:
> > >>  So, I'm in favour of creating BR2_PACKAGE_HOST_UUU and killing
> > >> BR2_PACKAGE_HOST_MFGTOOLS.
> > >>
> > >>  I marked the patch as Not Applicable in patchwork. If you convince me to do it
> > >> this way after all, we can fish it up again.
> > > 
> > > Ok I can do that. I'll offer another series that deprecates mfgtools and creates
> > > a new uuu package.
> > 
> >  Maybe first Peter and Thomas can confirm that this is the right approach?
> > 
> >  In summary: the current version of mfgtools creates a completely different
> > program called uuu that is used in a completely different way. In other words,
> > existing scripts will no longer work. Because of this, my proposal is to create
> > a new package for it, and move the existing mfgtools to legacy.
> 
> Why ditch the older one? People are almost certain to have scripts that
> rely on it, and since the new one is not a drop-in replacement, we can
> keep the old one.

Reasons behind that change were:
1- the current code keeps having build issues
2- the upstream project doesn't accept any patch anymore [1]
3- all NXP releases now use this new version, it doesn't provide scripts
   for the old tool any longer, even for imx6/7 releases [2]
4- the code is ugly (Windows tool ported to Linux at some point)
5- this tool is pretty much useless without imx-uuc, right now imx-uuc
   is working with both, but nothing is for sure about future uuc
   releases.

But if you feel strongly about maintaining that package on our own in BR
let me know.

Regards,
Gary

[1] https://github.com/NXPmicro/mfgtools/pull/104
[2] https://www.nxp.com/webapp/Download?colCode=imx-yocto-L4.14.98_2.0.0_ga
