From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:57:55 +0200
Subject: [Buildroot] [PATCH 2/8] infra/pkg-generic: don't set
 INSTALL_{TARGET, STAGING, IMAGES} for host
In-Reply-To: <c6febf929ca8d42bbd7d053643dc342272fe4f74.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <c6febf929ca8d42bbd7d053643dc342272fe4f74.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200425145755.7f3a24ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:27 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> By their very nature, host packages have no target, staging, or
> images install steps; they have a single install step, that is
> always performed.
> 
> As sucj, setting the corresponding _INSTALL_{TARGET,STAGING,IMAGES}
> variables does not make sense for host packages.
> 
> However, people (and scripts) may get confused when they process the
> output of printvars, e.g.:
> 
>     $ make printvars VARS=HOST_LIBTOOL_INSTALL_TARGET
>     HOST_LIBTOOL_INSTALL_TARGET=YES
> 
> Only set those variables for target packages. There is no corresponding
> variable for host packages, as they are always installed (and only
> once).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop at gmail.com
> ---
>  package/pkg-generic.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
