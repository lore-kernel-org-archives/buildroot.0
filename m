From: Atharva Lele <itsatharva@gmail.com>
Date: Wed, 07 Aug 2019 11:32:52 +0530
Subject: [Buildroot] [PATCH 1/6] autobuild-run: use different output
 directories for reproducible builds testing
In-Reply-To: <20190806213724.33e3f302@windsurf.home>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806213724.33e3f302@windsurf.home>
Message-ID: <8265074.T7ehH8mb2W@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 7, 2019 1:07:24 AM IST Thomas Petazzoni wrote:
> Hello,
> 
> On Tue,  6 Aug 2019 23:42:46 +0530
> 
> Atharva Lele <itsatharva@gmail.com> wrote:
> > Having different output directories increases variation in the build.
> > 
> > This commit also changes the directory name of the single output directory
> > to "output-1", as having varied length names for output directories
> > introduces a lot of reproducibility issues.
> > 
> > Official Debian efforts also currently use same length names for different
> > directories: "/build/1st/$pkg-$ver" and "/build/$pkg-$ver/2nd"
> > Cfr: https://tests.reproducible-builds.org/debian/index_variations.html
> 
> Is this an intermediate step, with the long term goal of supporting
> output directories of different length, or is this a limitation that we
> will have "forever" ?

Reproducible-Builds has proposed a spec called BUILD_PATH_PREFIX_MAP to help 
with this. However, that is still in the works and not fully solved yet. (As 
told to Yann and I on the #reproducible-builds IRC)

See: https://wiki.debian.org/ReproducibleBuilds/GCC-build-path and https://
reproducible-builds.org/specs/build-path-prefix-map/

So I think until further work is done on BUILD_PATH_PREFIX_MAP, we will have 
to stay with output directories of same length.

> Thanks!
> 
> Thomas

Regards,
Atharva Lele
