From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 23:17:25 +0200
Subject: [Buildroot] [PATCH 1/4] package/poco: fix the comment
 dependencies about riscv
In-Reply-To: <20200629210735.179913-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
Message-ID: <20200629231725.170ed988@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 23:07:32 +0200
Julien Olivain <juju@cotds.org> wrote:

> Commit 0737f48c5f "package/poco: disable build for riscv"
> changed the Kconfig package dependency, without updating the dependency
> of the comment. This patch set the comment dependency to the same
> condition as the package.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>

We really want to introduce a BR2_PACKAGE_POCO_ARCH_SUPPORTS option so
that those architecture dependencies are not repeated.

You can grep for BR2_PACKAGE_.*_ARCH_SUPPORTS to see other uses of that
pattern.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
