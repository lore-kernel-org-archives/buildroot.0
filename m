From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 4 Apr 2021 14:07:17 -0700
Subject: [Buildroot] [PATCH] package/micropython: Define
 MICROPY_NLR_SETJMP for xtensa
In-Reply-To: <CAFOYHZD3dkwzUuNvreiGM0H8csjxAwg92mhDn46JOQ_qtdZP-Q@mail.gmail.com>
References: <20210329072828.13989-1-judge.packham@gmail.com>
 <20210404154034.004bd3a7@windsurf.home>
 <CAFOYHZD3dkwzUuNvreiGM0H8csjxAwg92mhDn46JOQ_qtdZP-Q@mail.gmail.com>
Message-ID: <CAMo8Bf+ig7Wu8YoxSfjO7ekmJgRYUHRWoLry6K4ngybWB61TQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, Thomas,

On Sun, Apr 4, 2021 at 1:36 PM Chris Packham <judge.packham@gmail.com> wrote:
> On Mon, Apr 5, 2021 at 1:40 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Mon, 29 Mar 2021 20:28:28 +1300
> > Chris Packham <judge.packham@gmail.com> wrote:
> >
> > > As suggested on https://github.com/micropython/micropython/issues/6551
> > > define MICROPY_NLR_SETJMP to avoid the xtensa specific implementation
> > > of nlr_push.
> > >
> > > Fixes:
> > > - http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e
> > >
> > > Signed-off-by: Chris Packham <judge.packham@gmail.com>
> > > ---
> > >  package/micropython/micropython.mk | 5 +++++
> > >  1 file changed, 5 insertions(+)
> >
> > The build error really looks like a toolchain issue, but fair enough as
> > a temporary measure what you proposed is fine, so I've applied.

I'd say that this is an assembly coding issue. The compiler would not
generate such code and the linker has no support for connecting long
jumps on its own.

> I believe Max is already on the issue I raised upstream[1].

Yeah, there are additional issues. I'll try to see whether proposed solution
actually works (vs just fixing the build) and what can be done to the
failing assembly code.

-- 
Thanks.
-- Max
