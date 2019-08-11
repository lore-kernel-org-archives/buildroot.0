From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 15:39:35 +0200
Subject: [Buildroot] [PATCH v2 1/5] autobuild-run: use different output
 directories for reproducible builds testing
In-Reply-To: <20190810035902.14047-1-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
Message-ID: <20190811153935.5992bba4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Aug 2019 09:28:58 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Having different output directories increases variation in the build.
> 
> This commit also changes the directory name of the single output directory to
> "output-1", as having varied length names for output directories introduces a
> lot of reproducibility issues.
> 
> Official Debian efforts also currently use same length names for different
> directories: "/build/1st/$pkg-$ver" and "/build/$pkg-$ver/2nd"
> Cfr: https://tests.reproducible-builds.org/debian/index_variations.html
> 
> Reproducible-Builds has proposed a spec called BUILD_PATH_PREFIX_MAP to help
> with this. However, that is still in the works and not fully solved yet.
> (As told on the #reproducible-builds IRC).
> 
> So I think until further work is done on BUILD_PATH_PREFIX_MAP, we will have
> to stay with output directories of same length.
> 
> See: https://wiki.debian.org/ReproducibleBuilds/GCC-build-path and
> https://reproducible-builds.org/specs/build-path-prefix-map/
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added more details in commit log (suggested by Thomas)
> ---
>  scripts/autobuild-run | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
