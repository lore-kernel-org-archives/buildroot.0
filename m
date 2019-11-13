From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Nov 2019 18:15:44 +0200
Subject: [Buildroot] [PATCH 11/11] package/socat: drop optional readline
 dependency
In-Reply-To: <20191113151724.12155-12-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-12-peter@korsgaard.com>
Message-ID: <87k183eor3.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Nov 13 2019, Peter Korsgaard wrote:
> socat is licensed under GPL-2.0, which is not license compatible with
> readline (GPL-3.0+), so drop the optional dependency and add a comment
> explaining why.
>
> This also matches how socat is packaged in Debian, where the man page has
> the following snippet added:
>
> READLINE
>
>   Uses GNU readline and history on stdio to allow editing and reusing input lines (example).
>   Due to licensing restrictions the readline feature is disabled in Debian.  See BUGS.
>   You can use STDIO instead.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/socat/socat.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index c6f99c2afa..9e747e08fa 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -27,6 +27,8 @@ endif
>  # automake, so we can't use the normal autoreconf logic.
>  
>  SOCAT_DEPENDENCIES = host-autoconf
> +# incompatibile license (GPL-3.0+)
> +SOCAT_CONF_OPTS = --disable-readline
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  SOCAT_DEPENDENCIES += openssl
> @@ -34,12 +36,6 @@ else
>  SOCAT_CONF_OPTS += --disable-openssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> -SOCAT_DEPENDENCIES += readline
> -else
> -SOCAT_CONF_OPTS += --disable-readline
> -endif
> -
>  define SOCAT_RUN_AUTOCONF
>  	(cd $(@D); $(HOST_DIR)/bin/autoconf)
>  endef

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
