From: Herve Codina <herve.codina@bootlin.com>
Date: Tue, 22 Jun 2021 18:26:45 +0200
Subject: [Buildroot] [PATCH 02/15] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210621225254.5ad3e48b@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-3-herve.codina@bootlin.com>
 <20210621225254.5ad3e48b@windsurf>
Message-ID: <20210622182645.5a59f8f3@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 21 Jun 2021 22:52:54 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 21 Jun 2021 16:11:17 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > host-e2fsprog overwrites fsck program and some man related files
> > previously installed by host-util-linux.  
> 
> "The host-e2fsprogs package overwrites the fsck program and some
> manpages previously installed by the host-util-linux package".
> 

Ok, changed

> > 
> > This patch simply disable fsck in host-e2fsprog.  
> 
> disableS
> 
> host-e2fsprogs

Changed and s/host-e2fsprog/host-e2fsprogs/g

> 
> > host-e2fsprog is used to build final ext{2,3,4} images.  
> 
> host-e2fsprogs
> 
> > The missing host-e2fsprog fsck tool (filesystem integrity check  
> 
> host-e2fsprogs
> 
> > tool) in HOST_DIR should not lead to issues.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> With that:
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Added.
I will remove this Reviewed-by in my v2 patch if more modifications are needed
for this patch.

Thanks for the review,
Herv? Codina

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
