From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Jan 2018 18:08:16 +0200
Subject: [Buildroot] [PATCH 2/2] squid: add upstream post-3.5.27
 security patches
In-Reply-To: <20180122151339.23040-2-peter@korsgaard.com>
References: <20180122151339.23040-1-peter@korsgaard.com>
 <20180122151339.23040-2-peter@korsgaard.com>
Message-ID: <20180122160816.2246gixwadewjuec@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jan 22, 2018 at 04:13:39PM +0100, Peter Korsgaard wrote:
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -12,6 +12,9 @@ SQUID_LICENSE = GPL-2.0+
>  SQUID_LICENSE_FILES = COPYING
>  # For 0001-assume-get-certificate-ok.patch
>  SQUID_AUTORECONF = YES
> +SQUID_PATCH = \
> +	https://github.com/squid-cache/squid/commit/eb2db98a676321b814fc4a51c4fb7928a8bb45d9.patch \
> +	https://github.com/squid-cache/squid/commit/8232b83d3fa47a1399f155cb829db829369fbae9.patch

Didn't we stop fetching patches from github because they might break the hash 
in the future? See for example commit bbbe00ea35dd2133 (trinity: don't 
download patches from Github).

>  SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
