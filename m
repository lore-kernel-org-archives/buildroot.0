From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 12:23:39 +0200
Subject: [Buildroot] [PATCH 2/5] package/liblapack: add liblapack as
 virtual package with lapack and clapack as providers.
In-Reply-To: <20190801210920.31338-2-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-2-romain.naour@smile.fr>
Message-ID: <90898cde-8ddf-8b6a-196e-5e42f7f9fa55@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex, Romain,

On 01/08/2019 23:09, Romain Naour wrote:
> lapack and clapack are both generating the same liblapack.so but does not have
> the same symbols. So the run-time is broke. They have to exclude each other.

 We discussed this at the hackaton and reviewed all the options that were
discussed before on the mailing list, and we concluded that the simplest
solution is to remove clapack entirely. Everything that uses clapack (i.e.,
armadillo and numpy) can use lapack as well, as you mention, so the only reason
to keep clapack would be to support toolchains without Fortran compiler. Most of
our external toolchains do have Fortran support, and I expect that anybody who
cares about maths wouldn't mind enabling Fortran in their toolchains.

 If anybody disagrees with that, now is the time to speak up :-)

 So, I've marked the rest of the series as Changes Requested.

 Regards,
 Arnout

> A liblapack virtual package havev been created. It include lapack and clapack
> as providers.
> The armadillo packet require clapack to build, but lapack with complex support
> works as well.
