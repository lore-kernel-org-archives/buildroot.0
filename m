From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Thu, 20 Nov 2014 11:48:44 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
In-Reply-To: <20141119214258.GB3779@free.fr>
References: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
 <20141118202246.GG4333@free.fr> <546C4ACA.6030008@sensefly.com>
 <20141119214258.GB3779@free.fr>
Message-ID: <20141120114844.248ab803@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, 19 Nov 2014 22:42:58 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Nicolas, All,
> 
> On 2014-11-19 08:46 +0100, Nicolas Serafini spake thusly:
> > Le 18. 11. 14 21:22, Yann E. MORIN a ?crit :
> > >Nicolas, All,
> > >
> > >On 2014-11-05 16:52 +0100, Nicolas Serafini spake thusly:
> > >>This patch adds a new package for all libraries, drivers and
> > >>codecs provided by Nvidia Linux 4 Tegra release 16.4.0.
> > >
> > >I'm already working on a package for the Nvidia blobs for i386 and
> > >x86_64, so I think your submision could fit in that effort.
> 
> > This patch was only for Tegra2 and Tegra3 but it's possible to
> > integrate blobs for Tegra 4 and Tegra K1 too. It was my idea in a
> > future patch update.
> 
> Yes, let's start simple, and build from there.
> 
> > All binaries and docs can be found here
> > https://developer.nvidia.com/linux-tegra
> > 
> > Let me know if I can help you for the tegra part.
> 
> Yup, I do not have access to a Tegra device, so I'll rely on you for
> testing.

I can easily test for Tegra3 architecture but I have no more Tegra2
devices. It was a old Tegra2 patch I have done few month ago that was
working and I have updated for the Tegra3.

So if anyone would like to help for Tegra2, from my side I going to
look if I can get another Tegra2 device.

> 
> However, I already noticed something we can improve with that patch:
> trim it down to a reasonable size, by off-loading the GL headers to
> their own package, using the headers from the OpenGL registry, for
> which I already have a package ready:
> 
>     https://www.opengl.org/registry/
>     http://patchwork.ozlabs.org/patch/396955/
> 
> I still have a few things to do on that package, though, but is
> working pretty Ok for the x86 NVidia blob, so there's good hope it
> works for the Tegra variant as well.

I saw your patch and the GL header comes from the revision 23432 except
for the eglplatform.h that comes from revision 12306. I doesn't know
exactly why but it's what was provided by the Nvidia partner that does
the tegra device I use.

> 
> I won;t be able to touch that before the WE, though, and it;s low
> priority because we're in feature-freeze until the end of November
> anyway (so fixing stuff comes first).

I have just seen that NVidia has released the V16.5 of Linux4Tegra for
The Tegra3 only and it's exclusively distributed via NVIDIA's partner
portal but it's only fix on memory leaks in gstreamer plugins.

> 
> I'll get you posted on the progress. ;-)

Ok perfect 

Best regards

Nicolas

> 
> Regards,
> Yann E. MORIN.
> 
> 



-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
