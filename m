From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:01:17 +0200
Subject: [Buildroot] [PATCH] mesa3d: fix build with gcc <= 4.7 on some
 architectures
In-Reply-To: <20180507115036.25768-1-thomas.petazzoni@bootlin.com>
References: <20180507115036.25768-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180508150117.76825e2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 13:50:36 +0200, Thomas Petazzoni wrote:
> The configure.ac check for atomic intrinsics assumes that if an atomic
> intrinsic is not available, it's because we must link with
> libatomic. Except that libatomic is not always available, for example
> with gcc <= 4.7.
> 
> To fix this, this commit adds a patch that reworks the atomic check in
> configure.ac. It has been submitted upstream, and tested in a number
> of different combinations.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b045488d880a4013ed82937e7115b7636867e01d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../0003-configure.ac-rework-latomic-check.patch   | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 package/mesa3d/0003-configure.ac-rework-latomic-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
