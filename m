From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:31:11 +0100
Subject: [Buildroot] [PATCHv2 2/2] package/zstd: link programs
 dynamically with libzstd to save space
In-Reply-To: <20201204095703.4714-2-patrickdepinguin@gmail.com>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
 <20201204095703.4714-2-patrickdepinguin@gmail.com>
Message-ID: <20210117153111.58379c24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Dec 2020 10:57:02 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Even when a shared libzstd is built, the zstd command-line programs are
> statically linked with libzstd, causing a large rootfs footprint.
> 
> While the cmake backend in zstd already supported a flag
> ZSTD_PROGRAMS_LINK_SHARED, the make backend did not.
> 
> This commit adds support for ZSTD_PROGRAMS_LINK_SHARED in the make system
> and applies it for the target compilation, unless only static libs are
> supported.
> 
> See https://github.com/facebook/zstd/issues/2261 .
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: no functional changes other than splitting off part to a separate patch

I've marked as Changes Requested, as you proposed in the review of
PATCH 1/2 in this series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
