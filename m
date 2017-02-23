From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:52:15 +0100
Subject: [Buildroot] [PATCH] package/sslh: fix script,
 does not build in parallel
In-Reply-To: <1487711542-31294-1-git-send-email-yann.morin.1998@free.fr>
References: <1487711542-31294-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170223215215.5e201a82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 22:12:22 +0100, Yann E. MORIN wrote:
> The Makefile is not parallel-safe, so we build with MAKE1. Since the
> source is very small, this has minor impact on perforance.
> 
> The genver.sh script conaains a troll character U+c2a0 (non-break space)
> which is refused by some versions of /bin/sh. Patch it away.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/867/867c74ed74fd04ab06d1a10ff34ca177fe005fd2/
>     http://autobuild.buildroot.net/results/f97/f971629bc99147f9014e52c6ef71c3417faa6b67/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: David Bachelart <david.bachelart@bbright.com>
> ---
>  package/sslh/0002-replace-U+c2a0.patch | 12 ++++++++++++
>  package/sslh/sslh.mk                   |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100644 package/sslh/0002-replace-U+c2a0.patch

Applied to master after fixing the typoes, thanks! Did you submit the
patch to the upstream project, and report the parallel build issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
