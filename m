From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Feb 2019 21:08:18 +0100
Subject: [Buildroot] [PATCH] package/postgresql: bump to version 11.2
In-Reply-To: <20190217171908.30080-1-peter@korsgaard.com>
References: <20190217171908.30080-1-peter@korsgaard.com>
Message-ID: <20190218210818.1e93e0ca@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 17 Feb 2019 18:19:07 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes a long standing fsync issue and a number of other bugs:
> https://www.postgresql.org/docs/11/release-11-2.html
> 
> https://wiki.postgresql.org/wiki/Fsync_Errors
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/postgresql/postgresql.hash | 10 +++++-----
>  package/postgresql/postgresql.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 28d4a988d2..c4d7ab55bb 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,7 +1,7 @@
> -# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.md5
> -md5 5e45f6d5b859cc76b5d62f1e328e9711  postgresql-11.1.tar.bz2
> -# From https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2.sha256
> -sha256 90815e812874831e9a4bf6e1136bf73bc2c5a0464ef142e2dfea40cda206db08  postgresql-11.1.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.md5
> +md5 19d43be679cb0d55363feb8926af3a0f  postgresql-11.2.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2.sha256
> +sha256 2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405  postgresql-11.2.tar.bz2
>  
>  # License file, Locally calculated
> -sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
> +sha256	c4c86d683970b22b9fab53320ee1b3a30ef4e8223122b4fb6be53ea62ecee8b3  COPYRIGHT

	$ diff -u  build/postgresql-11.1/COPYRIGHT build/postgresql-11.2/COPYRIGHT 
--- build/postgresql-11.1/COPYRIGHT	2018-11-07 00:56:26.000000000 +0100
+++ build/postgresql-11.2/COPYRIGHT	2019-02-11 22:17:27.000000000 +0100
@@ -1,7 +1,7 @@
 PostgreSQL Database Management System
 (formerly known as Postgres, then as Postgres95)
 
-Portions Copyright (c) 1996-2018, PostgreSQL Global Development Group
+Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group
 
 Portions Copyright (c) 1994, The Regents of the University of California

Only update of the copyright year (worth mentioning in the commit log?)...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index fefbcf5f06..c7e9f526fc 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 11.1
> +POSTGRESQL_VERSION = 11.2
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
