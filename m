From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:40:05 +0100
Subject: [Buildroot] [PATCH] packages: carry site-method archive format
 version when overriding _SOURCE
In-Reply-To: <20210118181612.77863-1-yann.morin.1998@free.fr>
References: <20210118181612.77863-1-yann.morin.1998@free.fr>
Message-ID: <20210118224005.4ecd8ee3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 19:16:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 5b95a5dc2 (support/download: change format of archives generated
> from git) changed the way the archives generated from git repositories
> are named, adding a "format-version" identifier right between the
> package version and the file extension.
> 
> Commit c043ecb20 (support/download: change format of archives generated
> from svn) did so for archives generated from a subversion checkout.
> 
> However, for the a few packages, we manually force the _SOURCE variable,
> because we want to share the archive with another package, to avoid
> downloading and storing those archives twice. This is the case for:
> 
>   - linux-headers and linux
>   - barebox-aux and barebox
> 
> When the generated tarballs were renamed with the aforementioned
> commits, those packages were not updated accordingly.
> 
> Fix that by manually propagating the per-site-method format-version.
> 
> Reported-by: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  boot/barebox/barebox.mk                | 2 +-
>  package/linux-headers/linux-headers.mk | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

I find it not so nice that this "internal" detail has to creep in all
the way up to barebox.mk and linux-headers.mk, but for the time being:
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
