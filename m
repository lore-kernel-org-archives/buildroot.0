From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:02:12 +0200
Subject: [Buildroot] [PATCH] trousers/tpm-tools: enable on ARC
In-Reply-To: <20180628105814.11509-1-didin@synopsys.com>
References: <20180628105814.11509-1-didin@synopsys.com>
Message-ID: <20180628220212.31c09020@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 13:58:14 +0300, Evgeniy Didin wrote:
> With the latest ARC toolchain arc-2018.03 builds of "trousers" and
> "tpm-tools" packages perform without errors.
> Lets enable these packages for ARC.
> 
> With the exception, building tpm-tools for ARC770/750 requires to pass
> "-mno-compact-casesi" as it was made for trousers before: 
> see patch f4cd8ceb9cfa "trousers: Pass "-mno-compact-casesi" when
> building for ARCv1".
> This change is a temporary workaround and the feature is going to be
> fixed in the next ARC toolchain release version.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  package/tpm-tools/Config.in    | 2 --
>  package/tpm-tools/tpm-tools.mk | 4 ++++
>  package/trousers/Config.in     | 3 ---
>  3 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
