From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Nov 2014 08:19:46 +0200
Subject: [Buildroot] [PATCH 4/4] docs/manual: document the new variable
 FOO_UPSTREAM_SOURCE
In-Reply-To: <51470d856dde581d14c2e20bad669cd36332ae5b.1416068005.git.yann.morin.1998@free.fr>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <51470d856dde581d14c2e20bad669cd36332ae5b.1416068005.git.yann.morin.1998@free.fr>
Message-ID: <20141116061946.GA2449@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Nov 15, 2014 at 05:19:29PM +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/adding-packages-generic.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 67a7453..5295681 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -211,6 +211,17 @@ information is (assuming the package name is +libfoo+) :
>    +libfoo-$(LIBFOO_VERSION).tar.gz+. +
>    Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
>  
> +* +LIBFOO_UPSTREAM_SOURCE+ may contain the name of the tarball as
> +  known by upstream. If +HOST_LIBFOO_UPSTREAM_SOURCE+ is not specified,
> +  it defaults to +LIBFOO_UPSTREAM_SOURCE+. If none is specified, then
> +  the value is assumed to be the same as +LIBFOO_SOURCE+.
> +
> +.Note
> ++LIBFOO_SOURCE+ is the filename we want to save the tarball as, while
> ++LIBFOO_UPSTREAM_SOURCE+ is the name by which upstream names that
> +tarball. The two are usually the same, except in very rare cases, so you
> +normally should not have to set +LIBFOO_UPSTREAM_SOURCE+.

I think it is worth clarifying which name the .hash file should refer in this 
case. I guess this is LIBFOO_SOURCE, isn't it?.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
