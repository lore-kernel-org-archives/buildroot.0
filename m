From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:24:31 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.{0, 1}.x series
In-Reply-To: <20190527113318.523-1-peter@korsgaard.com>
References: <20190527113318.523-1-peter@korsgaard.com>
Message-ID: <20190601142431.697f526a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 May 2019 13:33:17 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/Config.in                      |  2 +-
>  linux/linux.hash                     | 10 +++++-----
>  package/linux-headers/Config.in.host | 10 +++++-----
>  3 files changed, 11 insertions(+), 11 deletions(-)

I've applied to master, after fixing one minor nit, see below.

> diff --git a/linux/linux.hash b/linux/linux.hash
> index 0a17592799..4654f741b0 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,8 +1,8 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.xz
> -sha256 7fbd0b3d90a7a28a013f1e3f006c02235c12b41fd020460722a0b7c9936db0d8  linux-5.0.18.tar.xz
> +sha256 0bf0d5c64dafc1184e9aafd2f3ebb77aa88ddee881a7766436258feaa214d9ec  linux-5.0.19.tar.xz
> +sha256 d79f90f5ca97befbfee4e247204b2ac4f45e7bb03d63a79184bc748cf3cf6ddb  linux-5.1.5.tar.xz

All this file is sorted with the newest version first, and the oldest
version last, but suddenly, you swapped 5.1 and 5.0, with 5.0 being
first, and 5.1 second. So I reinverted those lines to keep the order.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
