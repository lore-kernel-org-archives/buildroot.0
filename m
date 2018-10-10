From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:31:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: increase
 precision of timestamps
In-Reply-To: <20180921133117.9300-2-thomas.petazzoni@bootlin.com>
References: <20180921133117.9300-1-thomas.petazzoni@bootlin.com>
 <20180921133117.9300-2-thomas.petazzoni@bootlin.com>
Message-ID: <20181010213101.50764fa1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 15:31:16 +0200, Thomas Petazzoni wrote:
> Currently, the timestamps that we keep in build-time.log use a
> second-level precision. However, as we are going to introduce a new
> type of graph to draw the time line of a build, this precision is
> going to be insufficient, as a number of steps are so short that they
> are not even one second long, and generally the rounding to the second
> gives a not so great looking graph.
> 
> Therefore, we add to the timestamps the nanoseconds using the %N date
> specifier. A milli-second precision would have been sufficient, but %N
> is all what date(1) provides at the sub-second level.
> 
> Since this is changing the format of the build-time.log file, this
> commit adjusts the support/scripts/graph-build-time script
> accordingly, to account for the floating point numbers that we have as
> timestamps.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk           | 2 +-
>  support/scripts/graph-build-time | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
