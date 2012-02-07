From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 21:05:50 +0100
Subject: [Buildroot] [PATCH] sam-ba is host only
In-Reply-To: <1328620373-8784-2-git-send-email-alexandre.belloni@piout.net>
References: <1328620373-8784-1-git-send-email-alexandre.belloni@piout.net>
 <1328620373-8784-2-git-send-email-alexandre.belloni@piout.net>
Message-ID: <201202072105.50249.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 14:12:53 Alexandre Belloni wrote:
> Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/sam-ba/sam-ba.mk |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
> index d00575c..ad02326 100644
> --- a/package/sam-ba/sam-ba.mk
> +++ b/package/sam-ba/sam-ba.mk
> @@ -1,9 +1,9 @@
> -SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
> -SAM_BA_VERSION = 2.10
> -SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
> +HOST_SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
> +HOST_SAM_BA_VERSION = 2.10
> +HOST_SAM_BA_SOURCE  = sam-ba_$(HOST_SAM_BA_VERSION).zip
>  
>  define HOST_SAM_BA_EXTRACT_CMDS
> -        unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
> +        unzip -d $(BUILD_DIR) $(DL_DIR)/$(HOST_SAM_BA_SOURCE)
>          mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
>          rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
>  endef

 With 4 packages using it, it's time to add support for zip to the generic 
extract...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
