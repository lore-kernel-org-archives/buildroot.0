From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:07:48 +0200
Subject: [Buildroot] [PATCH 3/8] core/show-info: report install types
 for virtual packages too
In-Reply-To: <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200425150748.686f2117@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:28 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Although virtual packages do not usually install anything, they do
> participate in the dependency chain, and they also transition smoothly
> from 'not handled yet' all the way down to 'all set'. And in fact, it
> happens that some virtual packages do install something; for example,
> the virtual package 'toolchain' does tweak the musl headers during a
> post staging hook.
> 
> As such, people may want to know when those packages have been handled.
> To that goal, they will need to know what stampfile to look at (the
> target, staging, or images ones) to identify what step the virtual
> package is at.
> 
> So, report the type of install steps for virtual packages too, which
> means for all packages.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop at gmail.com
> ---
>  package/pkg-utils.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I've applied, but with a significantly reworked commit log to clarify
the intention. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
