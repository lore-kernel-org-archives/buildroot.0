From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Mar 2015 22:15:28 +0200
Subject: [Buildroot] [PATCH v1 1/3] postgresql: enable uclibc build
In-Reply-To: <1425930178-16084-1-git-send-email-ps.report@gmx.net>
References: <1425930178-16084-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150309201527.GK2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Mar 09, 2015 at 08:42:56PM +0100, Peter Seiderer wrote:
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index 3ef5e6c..519b2a1 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -1,9 +1,5 @@
>  config BR2_PACKAGE_POSTGRESQL
>  	bool "postgresql"
> -	# PostgreSQL does not build against uClibc with locales
> -	# enabled, due to an uClibc bug, see
> -	# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
> -	depends on BR2_TOOLCHAIN_USES_GLIBC

Please also remove the BR2_TOOLCHAIN_USES_GLIBC dependency from packages 
selecting BR2_PACKAGE_POSTGRESQL.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
