From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Sep 2018 06:56:29 +0300
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
In-Reply-To: <20180921031640.2238-1-benj.calderon@gmail.com>
References: <20180921031640.2238-1-benj.calderon@gmail.com>
Message-ID: <87worfsdua.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benjamin,

Benjamin Calderon writes:
> This commit installs font-awesome in the standard fonts directory
> making it available systemwide.
>
> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> ---
>  package/font-awesome/font-awesome.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
> index f39401041a..b1026b3c4d 100644
> --- a/package/font-awesome/font-awesome.mk
> +++ b/package/font-awesome/font-awesome.mk
> @@ -7,12 +7,10 @@
>  FONT_AWESOME_VERSION = v4.7.0
>  FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
>  FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
> -FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
>  
>  define FONT_AWESOME_INSTALL_TARGET_CMDS
> -	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
> -	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
> -		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
> +	mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
> +	cp $(@D)/fonts/FontAwesome.otf $(TARGET_DIR)/usr/share/fonts/font-awesome

What does this patch fix? What about the fonts in other directories?

>  endef
>  
>  $(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
