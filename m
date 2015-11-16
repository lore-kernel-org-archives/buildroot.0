From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:03:22 +0100
Subject: [Buildroot] [PATCH] package/gauche: fix getcontext not solved
 error on link
In-Reply-To: <201511131005.tADA5pt9030611@ms-omx02.plus.so-net.ne.jp>
References: <201511131005.tADA5pt9030611@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20151116230322.0f6137a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hiroshi,

On Fri, 13 Nov 2015 19:05:51 +0900, Hiroshi Kawashima wrote:
> This patch is ported from bdwgc package.
> Gauche use internal boehm gc so it has same problem.
> 
> I touch configure directly instead of configure.ac because autoreconf
> failed by version mismatch of autotools.
> 
> Will fix:
> http://autobuild.buildroot.org/results/8c6/8c6ce526735a36b8c8b4c6047e3c69039c4527cb//
> http://autobuild.buildroot.org/results/894/89460829a737a4dab19103f7a46905636420b0a8//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
>  ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   61 ++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644 package/gauche/0002-gc-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

Applied to master after tweaking the commit log and patch description,
thanks.

Also, please report to upstream that their configure.ac doesn't work
with modern version of the autotools, they should fix that up.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
