From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 22:42:58 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
In-Reply-To: <546C4ACA.6030008@sensefly.com>
References: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
 <20141118202246.GG4333@free.fr> <546C4ACA.6030008@sensefly.com>
Message-ID: <20141119214258.GB3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2014-11-19 08:46 +0100, Nicolas Serafini spake thusly:
> Le 18. 11. 14 21:22, Yann E. MORIN a ?crit :
> >Nicolas, All,
> >
> >On 2014-11-05 16:52 +0100, Nicolas Serafini spake thusly:
> >>This patch adds a new package for all libraries, drivers and codecs
> >>provided by Nvidia Linux 4 Tegra release 16.4.0.
> >
> >I'm already working on a package for the Nvidia blobs for i386 and
> >x86_64, so I think your submision could fit in that effort.

> This patch was only for Tegra2 and Tegra3 but it's possible to integrate
> blobs for Tegra 4 and Tegra K1 too. It was my idea in a future patch update.

Yes, let's start simple, and build from there.

> All binaries and docs can be found here
> https://developer.nvidia.com/linux-tegra
> 
> Let me know if I can help you for the tegra part.

Yup, I do not have access to a Tegra device, so I'll rely on you for
testing.

However, I already noticed something we can improve with that patch:
trim it down to a reasonable size, by off-loading the GL headers to
their own package, using the headers from the OpenGL registry, for which
I already have a package ready:

    https://www.opengl.org/registry/
    http://patchwork.ozlabs.org/patch/396955/

I still have a few things to do on that package, though, but is working
pretty Ok for the x86 NVidia blob, so there's good hope it works for the
Tegra variant as well.

I won;t be able to touch that before the WE, though, and it;s low
priority because we're in feature-freeze until the end of November
anyway (so fixing stuff comes first).

I'll get you posted on the progress. ;-)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
