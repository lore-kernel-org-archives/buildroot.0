From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 17:50:53 +0200
Subject: [Buildroot] [PATCH] package/tzdata: install missing files
In-Reply-To: <1399217322-16239-1-git-send-email-yann.morin.1998@free.fr>
References: <1399217322-16239-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140504155053.GL3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-05-04 17:28 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Install two files:
>   - zone.tab   : {country-code,coordinates,timezone} tuples
>   - iso3166.tab: {country-code,country} tuples
> 
> Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/tzdata/tzdata.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 05a82a2..e90be40 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -37,7 +37,8 @@ define TZDATA_BUILD_CMDS
>  endef
>  
>  define TZDATA_INSTALL_TARGET_CMDS
> -	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo
> +	$(INSTALL) -D -m 0644 $(@D)/zone.tab $(TARGET_DIR)/usr/share/zoneinfo/zone.tab
> +	$(INSTALL) -D -m 0644 $(@D)/iso3166.tab $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab
>  	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
>  	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
>  	for zone in posix/*; do                 \
> @@ -65,7 +66,8 @@ define HOST_TZDATA_BUILD_CMDS
>  endef
>  
>  define HOST_TZDATA_INSTALL_CMDS
> -	mkdir -p $(HOST_DIR)/usr/share/zoneinfo
> +	$(INSTALL) -D -m 0644 $(@D)/zone.tab $(TARGET_DIR)/usr/share/zoneinfo/zone.tab
> +	$(INSTALL) -D -m 0644 $(@D)/iso3166.tab $(TARGET_DIR)/usr/share/zoneinfo/iso3166.tab

Bad, this should go to $(HOST_DIR)...

Regards,
Yann E. MORIN.

>  	cp -a $(@D)/_output/* $(HOST_DIR)/usr/share/zoneinfo
>  endef
>  
> -- 
> 1.8.3.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
