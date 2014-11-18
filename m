From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 21:33:17 +0100
Subject: [Buildroot] [PATCH] rapidjson: simplify install commands
In-Reply-To: <1416320979-16563-1-git-send-email-eeppeliteloop@gmail.com>
References: <1416320979-16563-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <546BAD0D.5090605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 15:29, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (Checked that installed files are identical to the situation before this patch.)


 Regards,
 Arnout

> ---
>  package/rapidjson/rapidjson.mk | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
> index ff516c4..6658da2 100644
> --- a/package/rapidjson/rapidjson.mk
> +++ b/package/rapidjson/rapidjson.mk
> @@ -12,18 +12,7 @@ RAPIDJSON_INSTALL_TARGET = NO
>  RAPIDJSON_INSTALL_STAGING = YES
>  
>  define RAPIDJSON_INSTALL_STAGING_CMDS
> -    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson
> -    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/internal
> -    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/error
> -    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/msinttypes
> -    $(INSTALL) -m 0644 $(@D)/include/rapidjson/*.h \
> -        $(STAGING_DIR)/usr/include/rapidjson
> -    $(INSTALL) -m 0644 $(@D)/include/rapidjson/internal/*.h \
> -        $(STAGING_DIR)/usr/include/rapidjson/internal
> -    $(INSTALL) -m 0644 $(@D)/include/rapidjson/error/*.h \
> -        $(STAGING_DIR)/usr/include/rapidjson/error
> -    $(INSTALL) -m 0644 $(@D)/include/rapidjson/msinttypes/*.h \
> -        $(STAGING_DIR)/usr/include/rapidjson/msinttypes
> +    cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include
>  endef
>  
>  $(eval $(generic-package))
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
