From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 5 Apr 2021 08:36:39 +1200
Subject: [Buildroot] [PATCH] package/micropython: Define
 MICROPY_NLR_SETJMP for xtensa
In-Reply-To: <20210404154034.004bd3a7@windsurf.home>
References: <20210329072828.13989-1-judge.packham@gmail.com>
 <20210404154034.004bd3a7@windsurf.home>
Message-ID: <CAFOYHZD3dkwzUuNvreiGM0H8csjxAwg92mhDn46JOQ_qtdZP-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 5, 2021 at 1:40 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 29 Mar 2021 20:28:28 +1300
> Chris Packham <judge.packham@gmail.com> wrote:
>
> > As suggested on https://github.com/micropython/micropython/issues/6551
> > define MICROPY_NLR_SETJMP to avoid the xtensa specific implementation
> > of nlr_push.
> >
> > Fixes:
> > - http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e
> >
> > Signed-off-by: Chris Packham <judge.packham@gmail.com>
> > ---
> >  package/micropython/micropython.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
>
> The build error really looks like a toolchain issue, but fair enough as
> a temporary measure what you proposed is fine, so I've applied.
>
> Could you perhaps e-mail the issue to Max Filippov
> <jcmvbkbc@gmail.com> ? He has been maintaining the Xtensa support in BR,
> including toolchain fixes, for quite some time.

I believe Max is already on the issue I raised upstream[1].

I don't really know anything about xtensa but I suspect there might be
a difference between building for bare-metal vs building for an OS.
Either that or the xtensa specific code is just broken and no-one else
has noticed.

[1] - https://github.com/micropython/micropython/issues/6551

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
