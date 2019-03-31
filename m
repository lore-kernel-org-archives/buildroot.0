From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 20:56:36 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: fix build of libintl.a
In-Reply-To: <20190331153429.7380-1-yann.morin.1998@free.fr>
References: <20190331153429.7380-1-yann.morin.1998@free.fr>
Message-ID: <20190331205636.1c64360a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 17:34:29 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since libintl.a can be pulled in during the build of other shared libs,
> it must be compiled with -fPIC, which is what gettext-tiny's Makefile
> would do.
> 
> Since we provide our own CFLAGS, they override those in the Makefile.
> 
> Fix that by ensurign that -fPIC is used when building the static
> library.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/a38/a3800fd4ef2536cc2b82d38ea752baa2b227bc64/
> 
> Also, since GETTEXT_TINY_OPTS is used only once and contains a single
> definition, get rid of it altogether.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gettext-tiny/gettext-tiny.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
