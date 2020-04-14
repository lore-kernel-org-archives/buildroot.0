From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 14 Apr 2020 09:47:48 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mfgtools: drop package
In-Reply-To: <20200414064624.GA277362@p1g2>
References: <20200109191020.1282319-1-joerg.krause@embedded.rocks>
 <20200109191020.1282319-2-joerg.krause@embedded.rocks>
 <20200210162656.GD335587@p1g2.work>
 <3e5e773be990132bab2d0067c5e2d69d02c8fe31.camel@embedded.rocks>
 <20200414064624.GA277362@p1g2>
Message-ID: <037e6ef02ea9e47f92daed0ac03bbe23231aafcb.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Tue, 2020-04-14 at 08:46 +0200, Gary Bisson wrote:
> Hi Jorg,
> 
> On Mon, Apr 13, 2020 at 10:24:06PM +0200, J?rg Krause wrote:
> > Hi Gary,
> > 
> > On Mon, 2020-02-10 at 17:26 +0100, Gary Bisson wrote:
> > > Hi Jorge,
> > > 
> > > On Thu, Jan 09, 2020 at 08:10:20PM +0100, J?rg Krause wrote:
> > > > As suggested in [1] the package mfgtools is dropped.
> > > > 
> > > > NXP did replaced the old mfgtools with the version number 0.2
> > > > enterily with the uuu (Universal Update Utility) which is somehow
> > > > named mfgtools 3.0 although the version scheme for the uuu tool is
> > > > 1.xx.yyy.
> > > > 
> > > > As the old mfgtools scripts are not compatible with the new uuu
> > > > tool and as imx-uuu goes hand-in-hand with imx-uuc, which we ship
> > > > for the target, the mfgtools package is dropped.
> > > 
> > > I know I'm the one who pushed for that commit to happen but now want to
> > > mitigate the claim above.
> > 
> > Thanks for your feedback and sorry for my late reply.
> > 
> > > True uuu depends on imx-uuc and mfgtools (1st of its name) too. BUT by
> > > looking at imx-uuc, the two use cases are separated into 2 different
> > > files:
> > > - uu.c: daemon that uses utp protocol to communicate with host
> > > - ufb.c: daemon that uses fastboot protocol to communicate with host
> > 
> > In fact, I am using mfgtools without imx-uuc, but with U-Boot.
> > 
> > > So I think it should be safe to have both host clients co-existing for
> > > now. Maybe uu.c will be removed at some point in the future but I guess
> > > NXP will leave it there for a while.
> > 
> > So, lets just update mfgtools to latest version (1.3.154), right?
> 
> No, mfgtools 1.x.y really is 'uuu', not mfgtools any more.

It is very confusing, how NXP deals with this. From my understanding,
mfgtools is the top level name for the image deploying tools.

In mfgtools 2 there was a seperate Windows and Linux build of the
'MfgToolLib', the linux command line utility was 'mfgtoolcli'. The
linux branch ended with v0.02, the windows branch with 0.06 -> 2.8.0.

Both branches are abandoned and replaced by libuuu and the command line utility uuu.
This new library and tool are introduced of an evolving mfgtools 3.0.

So, indeed there are two different tools, the old and abandoned
mfgtools 2 and the new mfgtools 3 (a.k.a uuu).

Note, that for the mfgtools 2 the tag v0.02 was only labeld as "Pre-
release" on Github.

> So since 'mfgtools' doesn't have any more build issues, I'd say we keep
> it as-is for people that use it. So the idea is _not_ to drop it.
> 
> Then just have your uuu addition patch, so basically both tools
> co-exist in Buildroot (as they serve different purposes).

If we really want to keep the mfgtools 2 package, we have to decide how
to name the new package:

a) imx-uuu
b) mfgtools3
c) mfgtools_uuu
d) something else

I'm voting for b) mfgtools3, as the github project name is still
'mfgtools' and the project is described as "uuu (Universal Update
Utility), mfgtools 3.0".

Best regards
J?rg Krause
