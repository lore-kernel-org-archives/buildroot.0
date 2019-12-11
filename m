From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Dec 2019 08:57:54 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libffi: fix build failure
 with powerpc7
In-Reply-To: <20191210231815.5756578e@windsurf.home>
References: <20191124090305.1015485-1-fontaine.fabrice@gmail.com>
 <20a72d62-aecb-be18-9bb7-2f69115e14ba@mind.be>
 <20191210231815.5756578e@windsurf.home>
Message-ID: <CAPi7W82sv3CP6veTjvDU-3DdrKVSzE4WO8QdPnRkyyiCK-n0+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le mar. 10 d?c. 2019 ? 23:18, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Tue, 3 Dec 2019 23:53:06 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > On 24/11/2019 10:03, Fabrice Fontaine wrote:
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >
> >  Upstream merged a different fix [1] which TBH doesn't look as good... Could you
> > check with upstream what is the better solution?
> >
> >  Regards,
> >  Arnout
> >
> > [1]
> > https://github.com/libffi/libffi/pull/532/commits/2138adb2a5b6a0bc2fe3518e0645eacc89b6f392
>
> Fabrice, have you had the chance to check with upstream what is the
> most correct fix?
I only checked if this upstream commit fix our build failure and the
answer is no.
This is not a surprise as our build failure is related to _Float128
being undefined and this commit fixes a build failure related to
__int128 being undefined.
So there is probably two distinct issues on powerpc.

However, I didn't contact upstream yet and I don't know if I want to
waste my time doing so.
Indeed, I sent them a PR one year ago to upstream one of our patch
(https://github.com/libffi/libffi/pull/448). This PR didn't get a
single comment ...
>
> Also, your commit title says it fixes it for powerpc7, but the issue
> also appears with older powerpc platforms, and indeed the upstream
> commit says it fixes the issue for powerpc7 and older platforms.
>
> Since the issue pops up quite a lot in the autobuilders, it would be
> nice if we could finalize this patch and merge it.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
