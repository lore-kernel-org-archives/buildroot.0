From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Dec 2017 21:11:15 +0100
Subject: [Buildroot] [PATCH] omxplayer: bump to version 2ee17b2
In-Reply-To: <20171201172755.9968-1-julius@kriukas.lt>
References: <20171201172755.9968-1-julius@kriukas.lt>
Message-ID: <20171201201115.GB5966@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julius, All,

On 2017-12-01 19:27 +0200, Julius Kriukas spake thusly:
> This patch updates omxplayer package to the latest commit on master as
> of 2017-12-01.
> 
> Latest omxplayer version no longer have partial buildroot support and
> Makefile.include file, but still contains some hardcoded include paths
> that needs to be removed before building.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

Pretty good, I'm happy with that second iteration, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a small nit, below...

[--SNIP--]
> diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
> index 4ee215b767..3715e48488 100644
> --- a/package/omxplayer/omxplayer.hash
> +++ b/package/omxplayer/omxplayer.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha1    23eb444757e445c127a7114ae233569cac64f984                          omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
> -sha256  93ebfd654314231749936e4fc09f5ec4a361806cdb640d7579a5106921e00299  omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
> +sha1    258316ff94a1f1e5e47a5bb1a28d324ab08871a9                          omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
> +sha256  c16498258ee78c59f9705b621e4b5b7b0673e1687d94681f9dc52451b1ceba48  omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz

Could also add a sha256 for the COPYING file, please?

See:
    https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Yes, this is a relatively new requirement.

Regards,
Yann E. MORIN.

> diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
> index 9bb58778c2..6e92250438 100644
> --- a/package/omxplayer/omxplayer.mk
> +++ b/package/omxplayer/omxplayer.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OMXPLAYER_VERSION = 6c90c7503ba4658221774759edf7f2ae816711de
> +OMXPLAYER_VERSION = 2ee17b22a6149a043a2e402580504f282c615373
>  OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
>  OMXPLAYER_LICENSE = GPL-2.0+
>  OMXPLAYER_LICENSE_FILES = COPYING
> @@ -23,14 +23,7 @@ OMXPLAYER_EXTRA_CFLAGS = \
>  # procedure is, well, tainted. Fix this by forcing the real,
>  # correct values.
>  OMXPLAYER_MAKE_ENV = \
> -	USE_BUILDROOT=1 \
> -	BUILDROOT=$(TOP_DIR) \
>  	SDKSTAGE=$(STAGING_DIR) \
> -	TARGETFS=$(TARGET_DIR) \
> -	TOOLCHAIN=$(HOST_DIR) \
> -	HOST=$(GNU_TARGET_NAME) \
> -	SYSROOT=$(STAGING_DIR) \
> -	JOBS=$(PARALLEL_JOBS) \
>  	$(TARGET_CONFIGURE_OPTS) \
>  	STRIP=true \
>  	CFLAGS="$(TARGET_CFLAGS) $(OMXPLAYER_EXTRA_CFLAGS)"
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
