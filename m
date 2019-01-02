From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 13:57:20 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: drop obsolete 3.2.x
 / 4.{1, 16, 18}.x versions
In-Reply-To: <20190102111140.13016-1-peter@korsgaard.com>
References: <20190102111140.13016-1-peter@korsgaard.com>
Message-ID: <20190102135720.232e4f5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Jan 2019 12:11:40 +0100, Peter Korsgaard wrote:
> According to https://www.kernel.org/category/releases.html, these kernel
> versions are no longer supported, so drop them now that we have added 4.20.x
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/linux.hash                     |  5 -----
>  package/linux-headers/Config.in.host | 23 -----------------------
>  2 files changed, 28 deletions(-)

We do have some Config.in.legacy handling for those options:

$ grep KERNEL_HEADERS Config.in.legacy 
config BR2_KERNEL_HEADERS_4_10
config BR2_KERNEL_HEADERS_4_11
config BR2_KERNEL_HEADERS_4_12
config BR2_KERNEL_HEADERS_4_13
config BR2_KERNEL_HEADERS_4_15
config BR2_KERNEL_HEADERS_4_17
config BR2_KERNEL_HEADERS_3_4
config BR2_KERNEL_HEADERS_3_10
config BR2_KERNEL_HEADERS_3_12
config BR2_KERNEL_HEADERS_4_8
config BR2_KERNEL_HEADERS_3_18
config BR2_KERNEL_HEADERS_4_7
config BR2_KERNEL_HEADERS_4_6
config BR2_KERNEL_HEADERS_4_5
config BR2_KERNEL_HEADERS_3_14
config BR2_KERNEL_HEADERS_4_3
config BR2_KERNEL_HEADERS_4_2
config BR2_KERNEL_HEADERS_4_0
config BR2_KERNEL_HEADERS_3_19
config BR2_KERNEL_HEADERS_3_17
config BR2_KERNEL_HEADERS_3_16
config BR2_KERNEL_HEADERS_3_0
config BR2_KERNEL_HEADERS_3_11
config BR2_KERNEL_HEADERS_3_13
config BR2_KERNEL_HEADERS_3_15
config BR2_KERNEL_HEADERS_3_8
config BR2_KERNEL_HEADERS_3_6
config BR2_KERNEL_HEADERS_3_7
config BR2_KERNEL_HEADERS_SNAP
config BR2_KERNEL_HEADERS_3_1
config BR2_KERNEL_HEADERS_3_3
config BR2_KERNEL_HEADERS_3_5

Shouldn't we continue with the same process ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
