From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Nov 2014 07:20:01 +0200
Subject: [Buildroot] [PATCHv2 17/74] netatalk: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417125452-18705-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417125452-18705-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141128052001.GF4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 27, 2014 at 10:56:35PM +0100, Thomas Petazzoni wrote:
> Also makes the installation init script unconditional.

Maybe "... makes the init script installation unconditional".

baruch

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/netatalk/netatalk.mk | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index 5ea55c2..6c1b640 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -50,12 +50,9 @@ else
>  	NETATALK_CONF_OPTS += --disable-cups
>  endif
>  
> -define NETATALK_INSTALL_EXTRA_FILES
> -	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
> -		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
> -			$(TARGET_DIR)/etc/init.d/S50netatalk
> +define NETATALK_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
> +		$(TARGET_DIR)/etc/init.d/S50netatalk
>  endef
>  
> -NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
> -
>  $(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
