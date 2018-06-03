From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:31:39 +0200
Subject: [Buildroot] [PATCH 1/5] support/docker: run apt-get update and
 apt-get install in two RUNs
In-Reply-To: <474022096f189332bf42c3da6e299b85f252efed.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
 <474022096f189332bf42c3da6e299b85f252efed.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <20180603203139.0ed74065@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 11:08:18 +0200, Yann E. MORIN wrote:
> In commit 7517aef4d (support/docker: limit the number of layers),
> we reduced the number of layers by coalescing multiple RUN commands
> into less commands.
> 
> In doing so, we especially coalesced "apt-get update" with "apt-get
> install".
> 
> However, the distribution we used is a pinned version of stretch, so
> we know that running apt-get update will always yield the same apt
> database.
> 
> If we split the two apt-get commands, then we can re-use any local
> intermediate image when we need to update the list of packages to
> install; this helps quite a bit when testing the docker files over
> and over again, with just slight variants in the packages list.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  support/docker/Dockerfile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
