From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:40:32 +0200
Subject: [Buildroot] [PATCH v2] package/musl: fix conflict with riscv
 kernel headers
In-Reply-To: <a34235eac6761a3c5c38451cde296dd7d88db86b.1565289527.git.baruch@tkos.co.il>
References: <a34235eac6761a3c5c38451cde296dd7d88db86b.1565289527.git.baruch@tkos.co.il>
Message-ID: <20190812234032.7caf1caf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Aug 2019 21:38:47 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add two upstream patches fixing musl vs kernel headers conflict. This
> fixes build of strace for risc64 at it happens to use headers from both
> sources.
> 
> Modify patch #3 to leave a single newline in user.h. Otherwise 'patch
> -E' in apply-patches.sh deletes user.h instead of leaving it empty.
> 
> Fixes (strace):
> http://autobuild.buildroot.net/results/ac32e83dc5eb5ce2809fc4b9d11f540dbdae9ed6/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Use upstream patch (slightly modified) for user.h
> ---
>  ...-risc64-conflict-with-kernel-headers.patch | 61 ++++++++++++++++
>  ...-remove-riscv64-bits-user.h-contents.patch | 69 +++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 package/musl/0002-fix-risc64-conflict-with-kernel-headers.patch
>  create mode 100644 package/musl/0003-remove-riscv64-bits-user.h-contents.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
