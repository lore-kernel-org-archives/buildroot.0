From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 11 Sep 2019 09:29:25 -0700
Subject: [Buildroot] Chromium v7 test
In-Reply-To: <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
References: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
 <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
Message-ID: <CAMWSM7iW0FxukQi3kV7njD_bgFXVyQoWSwHC8Nnz_r0iQOZb4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 11, 2019 at 3:24 AM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:
>
> Hi Fame, Joseph, buildroot,
>
> Sorry to resurrect this old thread! We're in the process of creating a
> buildroot package for CEF [0] and the work you've done on this Chromium package
> is interesting!
>

No problem. This is an interesting area, and I'd be glad to see some
Chromium based packages and applications added. Part of my motivation
for creating a Chromium package was actually to add CEF at some point.

> What's the status of this work and is there a more up to date branch? Perhaps
> we could collaborate?
>
>

The last build I tried was Chromium 75.0.3770.100. You can find that
branch here [1].

> On 05/09/2018 09:11, Fame Castle wrote:> Hi Joseph,
> > I finally found the time to test your chromium-v7-wip branch. I cloned the
> > repo (only the chromium-v7-wip branch) into a new buildroot folder. I then set
> > up a Linux 4.18 kernel, GlibC, Mesa and XOrg. The build fails at a step I
> > think I have seen before. (DeJa Vu?)
> > [snip]
> > Package nss was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `nss.pc'
> > to the PKG_CONFIG_PATH environment variable
> > No package 'nss' found
> > Could not run pkg-config.
> > [snip]
>
> I fixed this by adding `host-nss` to the dependencies. I also had to patch
> `crypto/nss_util.cc` to `#include <nss/nss.h>` directly because of a
> conflicting nss.h header in the include path (from glibc I think). My WIP
> changes are here [1], it starts to build but I'm still fighting components.
> This isn't really a priority for us atm, the CEF package is.
>
> @Joseph, I noticed that you removed the `bootstrap.py` stage and referenced
> `gn` directly (rather than `out/Release/gn`) in your patch to build Chromium
> v75 [2]. Is gn on your path somehow? I'm not sure if this WIP patch is supposed
> to work yet :)
>

Right. It's been a while since I've worked on this branch, but I would
assume that gn is being found on my system path here. I think my
intention was to add it as a package at some point. Anyway, the WIP
branch isn't supposed to work yet, which is why I haven't submitted
it.

> We're actively working on this, so happy to chat about it.
>

Thanks for starting the work on this, and I'm happy to contribute
however I can. If you push your work to a public repository, I'd be
happy to look it over, and you can CC me on any patches you send to
the mailing list.

Best,
Joseph

[1] https://github.com/jakogut/buildroot/tree/chromium-v7-wip
