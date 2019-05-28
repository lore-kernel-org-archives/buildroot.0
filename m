From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 May 2019 14:44:55 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add missing BSD-3-Clause
 license
In-Reply-To: <20190528124102.21981-1-yegorslists@googlemail.com>
References: <20190528124102.21981-1-yegorslists@googlemail.com>
Message-ID: <CAGm1_kttn7Ae5YM22rzmt_04P45JCg+usSTEMrTE0A6R6ar-wA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 28, 2019 at 2:41 PM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> According to the LICENSE file curve25519-donna is licensed under
> BSD-3-Clause license.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/dropbear/dropbear.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e10c851606..c1a27f85c5 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -7,7 +7,7 @@
>  DROPBEAR_VERSION = 2019.78
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
> -DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
> +DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause, BSD-3-Clause
>  DROPBEAR_LICENSE_FILES = LICENSE
>  DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
>  DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
> --
> 2.17.0
>

Btw what part of the LICENSE file shows at BSD-2-Clause-like license?

I see only this:

loginrec.c
loginrec.h
atomicio.h
atomicio.c
and strlcat() (included in util.c) are from OpenSSH 3.6.1p2, and are licensed
under the 2 point BSD license.

loginrec is written primarily by Andre Lucas, atomicio.c by Theo de Raadt.

strlcat() is (c) Todd C. Miller

Regards,
Yegor
