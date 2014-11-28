From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Nov 2014 07:35:34 +0200
Subject: [Buildroot] [PATCHv2 19/74] gpsd: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417125452-18705-20-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417125452-18705-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141128053534.GG4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 27, 2014 at 10:56:37PM +0100, Thomas Petazzoni wrote:
> Also makes the installation init script unconditional.

Same here.

baruch

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gpsd/gpsd.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 7dc27e8..5092b38 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -206,10 +206,11 @@ define GPSD_INSTALL_TARGET_CMDS
>  		$(SCONS) \
>  		$(GPSD_SCONS_OPTS) \
>  		install)
> -	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
> -		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
> -		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
> -	fi
> +endef
> +
> +define GPSD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd
> +	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
>  endef
>  
>  define GPSD_INSTALL_STAGING_CMDS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
