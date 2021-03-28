From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 23:03:31 +0200
Subject: [Buildroot] [PATCH] package/ca-certificates: bump to version
 20210119
In-Reply-To: <20210325143946.297692-1-john@metanate.com>
References: <20210325143946.297692-1-john@metanate.com>
Message-ID: <20210328210331.GU24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jon, All,

On 2021-03-25 14:39 +0000, John Keeping spake thusly:
> Upstream has switched to requiring python3, so change the dependency to
> always use host-python3.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ca-certificates/ca-certificates.hash |  4 ++--
>  package/ca-certificates/ca-certificates.mk   | 10 +++-------
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
> index 1ed1c3ca06..024034c977 100644
> --- a/package/ca-certificates/ca-certificates.hash
> +++ b/package/ca-certificates/ca-certificates.hash
> @@ -1,6 +1,6 @@
>  # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
> -sha1  f17235bc9c3aec538065a655681815c242a6d7d5  ca-certificates_20200601.tar.xz
> -sha256  43766d5a436519503dfd65ab83488ae33ab4d4ca3d0993797b58c92eb9ed4e63  ca-certificates_20200601.tar.xz
> +sha1  c9875aa16e42981c6975e59a11727539053e2299  ca-certificates_20210119.tar.xz
> +sha256  daa3afae563711c30a0586ddae4336e8e3974c2b627faaca404c4e0141b64665  ca-certificates_20210119.tar.xz
>  
>  # Locally computed
>  sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index 5c24d4be49..94302ea96b 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,14 +4,10 @@
>  #
>  ################################################################################
>  
> -CA_CERTIFICATES_VERSION = 20200601
> +CA_CERTIFICATES_VERSION = 20210119
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> -CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20200602T145955Z/pool/main/c/ca-certificates
> -CA_CERTIFICATES_DEPENDENCIES = host-openssl
> -# ca-certificates can be built with either python 2 or python 3
> -# but it must be at least python 2.7
> -CA_CERTIFICATES_DEPENDENCIES += \
> -	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20210325T091936Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>  
> -- 
> 2.31.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
