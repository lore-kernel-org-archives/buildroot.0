From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:54:29 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: fix passing
 remaining options to helper scripts
In-Reply-To: <20180411073121.4621-1-thomas.petazzoni@bootlin.com>
References: <20180411073121.4621-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180412225429.6007e6d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 09:31:21 +0200, Thomas Petazzoni wrote:
> When calling the backend-specific helper scripts, the remaining
> options are in ${@}. However, in order to let the helper script know
> that those remaining options should not be parsed, but instead passed
> as-is to the download tool, they must be separated from the main
> options by "--".
> 
> Without this, packages that use <pkg>_DL_OPTS, such as the
> amd-catalyst package, cannot download their tarball anymore.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/de818f6e4c8e63d5e8a49c445d10c34eccc40410/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: please review carefully. I am not sure this is the right
> fix. Looking at the history of dl-wrapper, I don't see where this --
> was passed before the recent rework, so I'm not sure my solution is
> correct.
> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
