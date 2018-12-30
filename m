From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:09:00 +0100
Subject: [Buildroot] [PATCH] package/e2fsprogs: bump to version 1.44.5
In-Reply-To: <c5a1fe48f39b959ad5d9d2496cb6a076b7ba68a6.1545939748.git.baruch@tkos.co.il>
References: <c5a1fe48f39b959ad5d9d2496cb6a076b7ba68a6.1545939748.git.baruch@tkos.co.il>
Message-ID: <20181230170900.12502f08@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 21:42:28 +0200, Baruch Siach wrote:
> Drop musl build fix patch; issue fixed in upstream commit 98c6113b4147
> ("Define __GNUC_PREREQ if necessary").
> 
> Drop the forced -DHAVE_SYS_STAT_H; issue fixed in upstream commit
> 68192a8f83e00 ("util: allow subst to build in cross build environemnt").
> 
> Drop libmagic disable in the host package. RHEL 5 is no longer a
> supported host platform; cfr. commit 27797caf76b ("docs/manual: update
> host gcc minimum required version").

Well according to the commit, the magic.h quirk was for "older hosts
such as RHEL 5", not necessarily strictly limited to RHEL5. But OK, we
need to drop such quirks at some point, so let's have a try at dropping
this one.

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...x-musl-compile-__GNUC_PREREQ-related.patch | 306 ------------------
>  package/e2fsprogs/e2fsprogs.hash              |   4 +-
>  package/e2fsprogs/e2fsprogs.mk                |  17 +-
>  3 files changed, 5 insertions(+), 322 deletions(-)
>  delete mode 100644 package/e2fsprogs/0001-Fix-musl-compile-__GNUC_PREREQ-related.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
