From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Sep 2019 13:49:07 +0200
Subject: [Buildroot] [PATCH] package/joe: license is GPL-2.0+
In-Reply-To: <CAGm1_kvyftWG87WG-Vn4whgi2jw=amS0PZoC5GHRUtV5-xQ+wg@mail.gmail.com>
References: <20190920113003.21711-1-peter@korsgaard.com>
 <CAGm1_kvyftWG87WG-Vn4whgi2jw=amS0PZoC5GHRUtV5-xQ+wg@mail.gmail.com>
Message-ID: <20190920134907.57655470@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Sep 2019 13:36:48 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> Hi Peter,
> 
> On Fri, Sep 20, 2019 at 1:30 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> >
> > Joe changed the COPYING file from GPL-1.0 to GPL-2.0 in the development
> > leading up to 3.8:
> >
> > https://sourceforge.net/p/joe-editor/mercurial/ci/d731f9b3794bc4c896f2efa1c97ac2c82c3365ac/
> >
> > So change the license to GPL-2.0+  
> 
> GPL-2.0+, GPL-2.0 etc. identifiers are deprecated [1].

I was aware of GPL-2.0+ being deprecated, but not GPL-2.0. And indeed
SPDX now uses GPL-2.0-or-later (instead of GPL-2.0+) and GPL-2.0-only
(instead of GPL-2.0).

> What should we do? Should we switch to the new ones?

Ideally yes, to follow SPDX. However, there are a few gotchas:

 - The number of packages that need to be changed (though that's easily
   doable with sed)

 - The potential backward compatibility breakage. If people have
   scripts/tools that parses our manifest.csv and interpret the license
   values, the renaming might break for them.

But maybe these are not that important, and sticking to SPDX is mort
important ?

Anyway, that's a separate discussion from Peter's patch. Peter's patch
is fine as-is, as it matches the current practice in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
