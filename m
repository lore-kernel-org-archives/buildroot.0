From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Mon, 27 May 2019 22:34:34 -0700
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <a8d62ed2-4d1a-4447-4a9c-c33c845e97c5@mind.be>
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
 <20190518221352.0630eaa6@windsurf>
 <e0c589d1-ce45-0132-43da-db2605b81616@micronovasrl.com>
 <74098714-11ae-9897-a5fb-71db0f04c44a@micronovasrl.com>
 <e0f46b82-02c0-7a4d-a67b-f21faa5ceda3@micronovasrl.com>
 <d08e9569-ab62-3cd2-e1ab-64b5c8aa85b8@mind.be>
 <87imtxl9us.fsf@dell.be.48ers.dk>
 <a8d62ed2-4d1a-4447-4a9c-c33c845e97c5@mind.be>
Message-ID: <CAJsd3zLx-ByBzk2znHnCJiZ0p2nozMDVwTx5T_+5twhJYGG3WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sub options ate my last reply. Re-posting to list.

On Sun, May 26, 2019 at 5:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/05/2019 13:43, Peter Korsgaard wrote:
> >>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> >
> > Hi,
> >
> >  >>> But IMHO we should proceed with dropping clapack.
> >
> >  >  Why? it is maintained, and it is a dependency of armadillo...
> >
> >  >  I had a deeper look, and actually lapack and clapack are the same, just
> >  > compiled differently: lapack is built with the fortran compiler, clapack is
> >  > generated with f2c (by upstream) and built with the C compiler. AFAIU, anything
> >  > that uses lapack should also be able to use clapack and vice versa.
> >
> >  >  We have two packages like that: numpy and armadillo. They both seem to support
> >  > both lapack and clapack.
> >
> >  >  So, it seems indeed removing clapack is the appropriate thing. Except: lapack
> >  > requires a fortran compiler, which is not always available. So in that sense, it
> >  > would actually be more appropriate to remove lapack...
> >
> >  >  But maybe it would be better to normally use lapack, and only enable clapack
> >  > when lapack isn't available (i.e. when there's no fortran compiler).
> >
> > Not knowing anything about (c)lapack (or fortran), is there any
> > performance advantage using lapack over clapack? Otherwise just always
> > using clapack seems like the simplest solution.
>
>  Sounds OK to me.
>
>  Bernd, you're the only one who ever made a real contribution to lapack. Thoughts?
>
>  Benjamin, you originally contributed lapack. Any ideas?

I think lapack also might serve as a useful reference design for
anyone trying to bring an external Fortran package into their build.

If one is much more difficult to maintain, it makes sense to get rid
of that one. I think in this case clapack might be pretty well
maintained, but in general it's nice to avoid intermediate sources as
they are just another level of indirection where problems can occur.

Don't feel very strongly one way or the other. At this point, both
will be in the history so breadcrumbs are there if someone wants to
use the package that has support dropped.

Cheers,
Ben

>
>  Regards,
>  Arnout
