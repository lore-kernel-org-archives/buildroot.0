From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 11 Sep 2019 17:50:41 +0100
Subject: [Buildroot] Chromium v7 test
In-Reply-To: <CAMWSM7iW0FxukQi3kV7njD_bgFXVyQoWSwHC8Nnz_r0iQOZb4g@mail.gmail.com>
References: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
 <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
 <CAMWSM7iW0FxukQi3kV7njD_bgFXVyQoWSwHC8Nnz_r0iQOZb4g@mail.gmail.com>
Message-ID: <d86c4082-efed-c7e8-e081-d6ff81583ec3@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thanks for getting back to us so quickly.

On 11/09/2019 17:29, Joseph Kogut wrote:
> On Wed, Sep 11, 2019 at 3:24 AM Thomas Preston
> <thomas.preston@codethink.co.uk> wrote:
>> Sorry to resurrect this old thread! We're in the process of creating a
>> buildroot package for CEF [0] and the work you've done on this Chromium package
>> is interesting!
> 
> No problem. This is an interesting area, and I'd be glad to see some
> Chromium based packages and applications added. Part of my motivation
> for creating a Chromium package was actually to add CEF at some point.

Okay great. Our original strategy was to have the CEF package depend on the
Chromium package but as it turns out, CEF modifies the Chromium source, then
relies heavily on the Chromium build system. This isn't something which
buildroot really supports, so we're just downloading the Chromium tarball in
the CEF package, using the _EXTRA_DOWNLOADS makefile variable.

This might change as we discover more though...

>> @Joseph, I noticed that you removed the `bootstrap.py` stage and referenced
>> `gn` directly (rather than `out/Release/gn`) in your patch to build Chromium
>> v75 [2]. Is gn on your path somehow? I'm not sure if this WIP patch is supposed
>> to work yet :)
> 
> Right. It's been a while since I've worked on this branch, but I would
> assume that gn is being found on my system path here. I think my
> intention was to add it as a package at some point. Anyway, the WIP
> branch isn't supposed to work yet, which is why I haven't submitted
> it.

Okay got it. There seems to be a copy of gn bundled in with the Chromium tarball
at buildtools/linux64/gn, which is what the depot_tools/gn script searches for
anyway - so we're just using that for now. We /think/ we can get away without
using depot_tools.

> Thanks for starting the work on this, and I'm happy to contribute
> however I can. If you push your work to a public repository, I'd be
> happy to look it over, and you can CC me on any patches you send to
> the mailing list.

Will do, much appreciated! There's nothing stopping us from working in the open
so we'll get patches out as soon as we can.

Tom
