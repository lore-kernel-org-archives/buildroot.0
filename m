From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 23:00:00 +0100
Subject: [Buildroot] [PATCH] package/mender: fix missing /var/lib
In-Reply-To: <20190215214253.28202-1-angelo@amarulasolutions.com>
References: <20190215214253.28202-1-angelo@amarulasolutions.com>
Message-ID: <20190215230000.43280704@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Fri, 15 Feb 2019 22:42:53 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Mender needs /var/lib directory to be available: on some configurations
> /var/lib is not available and thus the mender package installation fails.
> This patch does a mkdir to ensure the /var/lib directory is always
> available.
> 
> Fixes:
> http://autobuild.buildroot.net/results/02fde80f6b4bc57d5f2833bd979bf166252eab16

This reference was a build failure on the "next" branch, so one might
think that the issue only exists on the next branch. So I've replaced
this with a reference to a build failure that happens on the "master"
branch, which makes it clear this patch should be applied on master.

Also for future patches: please always leave one blank line before your
SoB.

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/mender/mender.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
