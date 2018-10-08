From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:35:43 +0200
Subject: [Buildroot] [PATCH] libaio: Link against libgcc and libc to
 avoid unresolved symbols
In-Reply-To: <20180928133734.2352-1-abrodkin@synopsys.com>
References: <20180928133734.2352-1-abrodkin@synopsys.com>
Message-ID: <20181008213543.24480f1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Sep 2018 16:37:34 +0300, Alexey Brodkin wrote:
> Fix proposed by Debian developers that makes sure all libgcc.a
> sybols used in libaio.so are built-in.
> 
> Fixes build failures of blktrace, lvm2 and the like users of libaio.
> 
> A couple of examples below:
> blktrace: http://autobuild.buildroot.net/results/5528ab59f1939a7eff7e85318f3b36283019cc50/
> lvm2:     http://autobuild.buildroot.net/results/a5dfc87f94b97135e5cc84f6a876114891ed9dd9/
> 
> And since we solve the problem in libaio sources there's no need to
> mess with compilation flags in Buildroot, thus partially revert
> commit ce6536ae500f ("libaio: work-around for PowerPC issue").
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  ...gainst-libgcc-to-avoid-unresolved-symbols.patch | 57 ++++++++++++++++++++++
>  package/libaio/libaio.mk                           |  6 ---
>  2 files changed, 57 insertions(+), 6 deletions(-)
>  create mode 100644 package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch

Applied to master with a slightly tweaked commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
