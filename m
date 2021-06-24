From: Herve Codina <herve.codina@bootlin.com>
Date: Thu, 24 Jun 2021 16:13:56 +0200
Subject: [Buildroot] [PATCH 02/15] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210622194024.GH44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-3-herve.codina@bootlin.com>
 <20210622194024.GH44262@scaer>
Message-ID: <20210624161356.327254c8@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Jun 2021 21:40:24 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Herv?, All,
> 
> On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> > host-e2fsprog overwrites fsck program and some man related files
> > previously installed by host-util-linux.
> > 
> > This patch simply disable fsck in host-e2fsprog.
> > 
> > host-e2fsprog is used to build final ext{2,3,4} images.
> > The missing host-e2fsprog fsck tool (filesystem integrity check
> > tool) in HOST_DIR should not lead to issues.  
> 
> And the target variant is not susceptible to that issue, because
> e2fsprogs' fsck depends on !BR2_PACKAGE_UTIL_LINUX_FSCK. So we're clean
> there.
> 
> Except for the comments by Thomas, you can carry my:
> 
>     Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> when you respin this patch.

Ok,
Reviewed-by added.

Thanks for the review,
Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
