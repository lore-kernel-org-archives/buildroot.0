From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 21:32:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/bustle: fix static build
In-Reply-To: <20210103134018.530599-1-fontaine.fabrice@gmail.com>
References: <20210103134018.530599-1-fontaine.fabrice@gmail.com>
Message-ID: <20210103203249.GO2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-03 14:40 +0100, Fabrice Fontaine spake thusly:
> Commit 436cb9308a50b1007a42eb490405a3155307a771 wrongly removed --static
> from pcap-config call
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b5d8d8d8452342373c2446613ba3051c20a97c03
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bustle/bustle.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
> index c6c3a72a91..9010754d90 100644
> --- a/package/bustle/bustle.mk
> +++ b/package/bustle/bustle.mk
> @@ -9,7 +9,7 @@ BUSTLE_SITE = https://hackage.haskell.org/package/bustle-$(BUSTLE_VERSION)
>  BUSTLE_LICENSE = LGPL-2.1+
>  BUSTLE_LICENSE_FILES = LICENSE
>  BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
> -BUSTLE_MAKE_OPTS = PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
> +BUSTLE_MAKE_OPTS = PCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config --static"

Before commit 436cb9308a50, this was conditional on BR2_STATIC_LIBS.
And I guess that, with BR2_SHARED_LIBS, --static does not makes sense
either...

Quid?

Regards,
Yann E. MORIN.

>  define BUSTLE_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -- 
> 2.29.2
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
