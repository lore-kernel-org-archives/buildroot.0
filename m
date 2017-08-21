From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:25:52 +0200
Subject: [Buildroot] [PATCH 1/3] kvmtool: add patch to fix build with
 musl
In-Reply-To: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
References: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821232552.486d2004@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Aug 2017 22:55:26 +0200, Thomas Petazzoni wrote:
> This commit backports an upstream patch that fixes the build of
> kvmtool with musl:
> 
> In file included from builtin-balloon.c:9:0:
> include/kvm/kvm.h:22:0: warning: "PAGE_SIZE" redefined
>  #define PAGE_SIZE (sysconf(_SC_PAGE_SIZE))
> 
> Fixes one part of:
> 
>   http://autobuild.buildroot.net/results/4459a909e735343d1cf768d30466bc3c57eca19e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../kvmtool/0001-avoid-redefining-PAGE_SIZE.patch  | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/kvmtool/0001-avoid-redefining-PAGE_SIZE.patch

All applied. Thanks Bernd for having tested the patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
