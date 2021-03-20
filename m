From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:47:50 +0100
Subject: [Buildroot] [PATCH] package/squid: Use external libltdl
In-Reply-To: <20210317060145.25009-1-post@lespocky.de>
References: <20210317060145.25009-1-post@lespocky.de>
Message-ID: <20210320224750.7a3fbe99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 07:01:45 +0100
Alexander Dahl <post@lespocky.de> wrote:

> When enabling BR2_PACKAGE_LIBTOOL it depended on the build order if
> squid used the external libltdl or built it from its internal copy. That
> broke the build in fli4l where we have additional post build checks
> analyzing runtime dependencies and a separate step for copying build
> artefacts to target packages.
> 
> Depend on the external libltdl unconditionally like done with commit
> 3efc5a250c1c ("package/siproxd: new package") for package siproxd
> recently as well. For reproducibility, size, and security.
> 
> Link: https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-sunxi/672/
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/squid/Config.in | 1 +
>  package/squid/squid.mk  | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
