From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 31 Oct 2019 15:39:56 +0100
Subject: [Buildroot] [PATCH v3,3/3] package/sysrepo: fix debug build
In-Reply-To: <20191031131507.1936-3-fontaine.fabrice@gmail.com>
References: <20191031131507.1936-1-fontaine.fabrice@gmail.com>
 <20191031131507.1936-3-fontaine.fabrice@gmail.com>
Message-ID: <CAEyMn7Zg6EfFCpWnj3vJj8PNXi0E5pO2Gh0mR20Hd9sFxKT-NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Do., 31. Okt. 2019 um 14:14 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Set IS_DEVELOPER_CONFIGURATION to OFF to avoid a build failure due to
> files being installed in wrong directory
>
> Fixes:
>  - http://autobuild.buildroot.org/results/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Heiko Thiery <heiko.thiery@kontron.com>

I was struggling with that issue since some hours  ;-) thanks for that patch

> ---
> Changes v2 -> v3:
>  - fix typo in package's name
>
>  package/sysrepo/sysrepo.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 72c380768d..8676158a19 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -13,6 +13,7 @@ SYSREPO_DEPENDENCIES = libev libnetconf2 libavl libyang pcre protobuf-c host-sys
>  HOST_SYSREPO_DEPENDENCIES = host-libev host-libnetconf2 host-libavl host-libyang host-pcre host-protobuf-c
>
>  SYSREPO_CONF_OPTS = \
> +       -DIS_DEVELOPER_CONFIGURATION=OFF \
>         -DGEN_PYTHON2_TESTS=OFF \
>         -DENABLE_TESTS=OFF \
>         -DGEN_CPP_BINDINGS=OFF \
> --
> 2.23.0
>
