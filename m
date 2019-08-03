From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 3 Aug 2019 13:09:21 +0200
Subject: [Buildroot] [PATCH 2/5] package/liblapack: add liblapack as
 virtual package with lapack and clapack as providers.
In-Reply-To: <90898cde-8ddf-8b6a-196e-5e42f7f9fa55@mind.be>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-2-romain.naour@smile.fr>
 <90898cde-8ddf-8b6a-196e-5e42f7f9fa55@mind.be>
Message-ID: <CAAXf6LVOq9X_YNG4xR+DeGeB66nr3iawzL-uPpzn_=MUJLCCzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 3, 2019, 12:23 Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Alex, Romain,
>
> On 01/08/2019 23:09, Romain Naour wrote:
> > lapack and clapack are both generating the same liblapack.so but does
> not have
> > the same symbols. So the run-time is broke. They have to exclude each
> other.
>
>  We discussed this at the hackaton and reviewed all the options that were
> discussed before on the mailing list, and we concluded that the simplest
> solution is to remove clapack entirely. Everything that uses clapack (i.e.,
> armadillo and numpy) can use lapack as well, as you mention, so the only
> reason
> to keep clapack would be to support toolchains without Fortran compiler.
> Most of
> our external toolchains do have Fortran support, and I expect that anybody
> who
> cares about maths wouldn't mind enabling Fortran in their toolchains.
>
>  If anybody disagrees with that, now is the time to speak up :-)
>


I'm going to analyze this change in detail next week, as we've been in this
situation and just now were working to switch from clapack to openblas as
backend to armadillo.

I'll report back...

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190803/a5ed1da9/attachment.html>
