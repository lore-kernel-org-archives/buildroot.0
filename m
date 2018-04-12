From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:54:33 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: pass the
 correct -N option
In-Reply-To: <20180411081024.15097-1-thomas.petazzoni@bootlin.com>
References: <20180411081024.15097-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180412225433.0b69c821@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 10:10:24 +0200, Thomas Petazzoni wrote:
> ${raw_name} is never defined in dl-wrapper, and therefore the value
> passed to the -N option is always empty. This causes a problem for the
> 'cvs' backend, which uses the value of this option as the CVS module
> to be downloaded.
> 
> If the name of the CVS module is omitted, all the CVS modules from
> that CVS repository are downloaded, which creates a tarball with a lot
> more contents, and the actual useful contents in a sub-directory,
> obviously breaking patches that should be applied, and the entire
> build process that follows.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fcee0e3d7eeeb373313b1794092c729b1b052348/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
