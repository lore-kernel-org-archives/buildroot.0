From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:26:58 +0200
Subject: [Buildroot] [PATCH] package/unbound: fix detection of libexpat
In-Reply-To: <20200405082203.24014-1-yann.morin.1998@free.fr>
References: <20200405082203.24014-1-yann.morin.1998@free.fr>
Message-ID: <20200405162658.49b5b525@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 10:22:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> unbound open-codes the detection of libexpat, and as all packages doing
> so, look in host paths (/usr/local /opt/local /usr/lib /usr/pkg /usr/sfw
> /usr). Obviously this is wrong for cross-compilation.
> 
> Do for libexpat as we do for openssl, and point unbound to staging dir,
> when we know expat is.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/a89ea6aa1cd8c253b1260ea227fea3dc9b095fe8/
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Stefan Ott <stefan@ott.net>
> ---
>  package/unbound/unbound.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
