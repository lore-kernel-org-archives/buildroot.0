From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:58:11 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: add 4.8.x choice for headers
In-Reply-To: <1473441497-29986-2-git-send-email-festevam@gmail.com>
References: <1473441497-29986-1-git-send-email-festevam@gmail.com>
 <1473441497-29986-2-git-send-email-festevam@gmail.com>
Message-ID: <20160911155811.06f1d70a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 14:18:15 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  toolchain/toolchain-common.in          | 5 +++++
>  toolchain/toolchain-external/Config.in | 4 ++++
>  2 files changed, 9 insertions(+)

This lacks the update to package/linux-headers/Config.in.host. I know
it's in PATCH 3/4, but PATCH 3/4 is not correct as it uses the kernel
headers from a release candidate as the default kernel headers, which
we never do.

However, we could merge the support for 4.8 kernel headers for those
who point to a custom kernel version, but for this, this patch should
gain some of the changes to package/linux-headers/Config.in.

Thoms
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
