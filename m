From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 22:06:51 +0100
Subject: [Buildroot] [PATCH v2 1/2] e2fsprogs: remove findfs option
In-Reply-To: <1455295206-15684-1-git-send-email-james.knight@rockwellcollins.com>
References: <1455295206-15684-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20160214220651.2cf79206@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 12 Feb 2016 11:40:05 -0500, James Knight wrote:
> The e2fsprogs package's findfs option provides no capabilities. When the
> option is selected, a symbolic link is generated from findfs to e2label;
> however, e2label will not handle findfs since the respective code is
> explicitly disabled when `--disable-libblkid` is passed in. At this
> time, the e2fsprogs package only supports findfs capabilities when
> building its "private blkid library".
> 
> Note that the `--disable-libblkid` configuration argument must remain
> to prevent conflicts with util-linux's libblkid and an e2fsprogs-
> generated variant (see e1ffc2f791b336339909c90559b7db40b455f172).
> 
> Since e2fsprogs cannot provide findfs capabilities, the option is being
> removed in this change. A following change will be introduced to include
> util-linux's findfs utility.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> Cc: Zheng Yi <yzheng@techyauld.com>
> ---
> Changes v1 -> v2:
>   - Add missing legacy handling (pointed out by Thomas Petazzoni).
> ---
>  Config.in.legacy               | 9 +++++++++
>  package/e2fsprogs/Config.in    | 5 -----
>  package/e2fsprogs/e2fsprogs.mk | 9 ---------
>  3 files changed, 9 insertions(+), 14 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
