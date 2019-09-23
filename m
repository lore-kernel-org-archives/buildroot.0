From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:10:51 +0200
Subject: [Buildroot] [PATCH v2] package/devmem2: remove package
In-Reply-To: <20190814102957.23544-1-unixmania@gmail.com>
References: <20190814102957.23544-1-unixmania@gmail.com>
Message-ID: <20190923221051.7115ce11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Wed, 14 Aug 2019 07:29:57 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> It was here just for backwards compatibility and is not used by any
> package or board after commits
> 
>   59856480b6 packages/devmem2: remove from all board configurations
>   2f6e3eae55 package/ti-gfx: do not use devmem2 in script
> 
> There are address casting issues with 32bit access on a 64bit bus (like
> on the SoC FPGA ARM processors) with this tool. The Busybox version of
> devmem is the most up to date and supports quadword access.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10171
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Ciro Santilli <ciro.santilli@gmail.com>
> CC: Matt Weber <matthew.weber@rockwellcollins.com>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1->v2: removed spurious "address" from commit message
> ---
>  Config.in.legacy                              |  7 +++
>  .../0001-be-coherent-in-type-usage.patch      | 52 -------------------
>  package/devmem2/Config.in                     |  7 ---
>  package/devmem2/devmem2.hash                  |  3 --
>  package/devmem2/devmem2.mk                    | 30 -----------
>  5 files changed, 7 insertions(+), 92 deletions(-)
>  delete mode 100644 package/devmem2/0001-be-coherent-in-type-usage.patch
>  delete mode 100644 package/devmem2/Config.in
>  delete mode 100644 package/devmem2/devmem2.hash
>  delete mode 100644 package/devmem2/devmem2.mk

Since nobody replied to my call for opinions, and I don't particularly
care about keeping devmem2 around, I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
