From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 05:49:33 +0300
Subject: [Buildroot] [PATCH 1/1] nginx: Bump to version 1.15.0
In-Reply-To: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
References: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
Message-ID: <20180629024933.zvlna6ikrhrige5b@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ignacy,

On Wed, Jun 27, 2018 at 03:51:46PM +0200, Ignacy Gaw?dzki wrote:
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  ...-rework-autotest-to-be-cross-compila.patch |   6 +-
>  ...-mechanism-allowing-to-force-feature.patch |   8 +-
>  ...ture_run_force_result-for-each-featu.patch |  56 ++--
>  ...auto-lib-libxslt-conf-use-pkg-config.patch |  10 +-
>  ...ake-sys_nerr-guessing-cross-friendly.patch |  16 +-
>  ...auto-lib-openssl-conf-use-pkg-config.patch | 249 ++++++++++++++++--
>  ...7-auto-lib-libgd-conf-use-pkg-config.patch |   6 +-
>  ...linux_config.h-only-include-dlfcn.h-.patch |   6 +-
>  ...x-PCRE-condition-WRT-the-http-and-ht.patch |  33 ---
>  package/nginx/nginx.hash                      |   4 +-
>  package/nginx/nginx.mk                        |   2 +-
>  11 files changed, 291 insertions(+), 105 deletions(-)
>  delete mode 100644 package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch
> 
> diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
> index 5b1a50b264..52c8da38c0 100644
> --- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
> +++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
> @@ -1,4 +1,4 @@
> -From fb158af083e72c9aa0a8dfd4c6965f950192a230 Mon Sep 17 00:00:00 2001
> +From 218eab509628bffd494516803fdef9585b2e30d8 Mon Sep 17 00:00:00 2001
>  From: Samuel Martin <s.martin49@gmail.com>
>  Date: Tue, 4 Jul 2017 11:09:20 -0400
>  Subject: [PATCH] auto/type/sizeof: rework autotest to be cross-compilation
> @@ -22,7 +22,7 @@ Refresh for 1.12.0
>   1 file changed, 28 insertions(+), 9 deletions(-)
>  
>  diff --git a/auto/types/sizeof b/auto/types/sizeof
> -index 480d8cf..61dcd2d 100644
> +index 480d8cfa..61dcd2de 100644
>  --- a/auto/types/sizeof
>  +++ b/auto/types/sizeof
>  @@ -14,7 +14,7 @@ END
> @@ -85,5 +85,5 @@ index 480d8cf..61dcd2d 100644
>   fi
>   
>  -- 
> -2.9.4
> +2.17.1

No need to touch patches that have not changed like this one.

[...]

> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 9936ca1dfa..51284aefbe 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256	305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416	nginx-1.12.2.tar.gz
> +sha256	b0b58c9a3fd73aa8b89edf5cfadc6641a352e0e6d3071db1eb3215d72b7fb516	nginx-1.15.0.tar.gz
>  # License files, locally calculated
> -sha256	75820469c890db641e54078df018e497fde0542211aa704e15320316a2175780	LICENSE
> +sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE

What are the changes in the LICENSE file? Please explain in the commit log.

> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index e5652af6df..23cf2b46d5 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.12.2
> +NGINX_VERSION = 1.15.0
>  NGINX_SITE = http://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
