From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 28 Aug 2018 12:36:08 -0400
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 10.5
In-Reply-To: <20180828163127.9989-1-aduskett@gmail.com>
References: <20180828163127.9989-1-aduskett@gmail.com>
Message-ID: <CAFSsvmpkvmmF-DbbJ8Uj=JUyJ=dg8AFwPg7K21Za=ao98N2nNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

I didn't realize that 2018.02 also has 10.3, I assumed (my mistake)
that 2018.02 had the v9 series and
I had planned on making a separate patch for that as well.

I would recommend that this patch should be applied to master, next,
and 2018.02.x

Thanks!
Adam

On Tue, Aug 28, 2018 at 12:31 PM Adam Duskett <aduskett@gmail.com> wrote:
>
> Fixes CVE-2018-10915 & CVE-2018-10925
>
> Changelog: https://www.postgresql.org/docs/10/static/release-10-5.html
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 533c398d59..a9cc93c76c 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,5 +1,5 @@
> -# From https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.bz2.sha256
> -sha256 6ea268780ee35e88c65cdb0af7955ad90b7d0ef34573867f223f14e43467931a        postgresql-10.3.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.bz2.sha256
> +sha256 6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011        postgresql-10.5.tar.bz2
>
>  # License file, Locally calculated
>  sha256 24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e        COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 0940873686..540e1540ca 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -POSTGRESQL_VERSION = 10.3
> +POSTGRESQL_VERSION = 10.5
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> --
> 2.17.1
>
