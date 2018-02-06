From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:03:52 +0100
Subject: [Buildroot] [PATCH v3 1/3] autobuilder: hung build: convert to
 monitor thread
In-Reply-To: <20180202205713.27191-3-matthew.weber@rockwellcollins.com>
References: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
 <20180202205713.27191-3-matthew.weber@rockwellcollins.com>
Message-ID: <20180206150352.6df17129@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 14:57:11 -0600, Matt Weber wrote:
> Check the build-time.log and monitor for modifications to
> determine if the build has hung for at most #mins
> before killing the build and reporting a timeout.
> 
> This allows infinite sized builds as we get to a lower
> number of autobr fails.  Less failures means we start
> to see false timeout failures when we hit the boundary
> of the old MAX_DURATION ~8hrs.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> --
> Change Log
> 
> v2 -> v3
>  - Adjust hung timeout to 2hrs as minic, gst-ffmpeg and qt5webkit
>    could go beyond 60mins on a minimal 2-4core machine while
>    processing a single build step written
> 
> v1->v2
> [Thomas P.
>  - Use mtime vs reading file
>  - Use datetime for hung delta check
>  - Removed camel case
>  - Added hung build event to sync hand-off back to main thread
> ---
>  scripts/autobuild-run | 58 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 49 insertions(+), 9 deletions(-)

Applied to buildroot-test, thanks!. Note that in this patch, and other
patches in this series, your From: didn't match the Signed-off-by, so I
had to rewrite these.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
