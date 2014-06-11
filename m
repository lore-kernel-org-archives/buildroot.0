From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 19:49:14 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/mesa3d: depend on udev
In-Reply-To: <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
 <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140611194914.2529d991@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 11 Jun 2014 19:41:48 +0200, Bernd Kuhls wrote:
> checking for LIBUDEV... no
> configure: error: libudev-dev required for building DRI
> 
> Fixes
> http://autobuild.buildroot.net/results/16d/16d12b986051db884eae86e9658e6c4fc0f28885/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Is this patch independent from PATCH 2/3 ? I'd like the mesa3d problem
to be fixed now, regardless of the split between libudev and the daemon
in eudev. The split between libudev and the daemon in eudev is an
improvement, while the mesa3d build failure affecting the autobuilders
since the past 3 days is a significant regression that we should handle
in priority.

I know that Yann is also working on this issue, I'm not sure how much
in sync both of you are.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
