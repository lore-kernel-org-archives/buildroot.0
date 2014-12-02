From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 2 Dec 2014 09:00:24 +0200
Subject: [Buildroot] [PATCH] ifplugd: remove spurious newline excape
In-Reply-To: <fb06c6bb75e7486b104103ed0de58d64fa3f2058.1417503529.git.baruch@tkos.co.il>
References: <fb06c6bb75e7486b104103ed0de58d64fa3f2058.1417503529.git.baruch@tkos.co.il>
Message-ID: <20141202070024.GA2263@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Tue, Dec 02, 2014 at 08:58:49AM +0200, Baruch Siach wrote:
> Commit 5ad5d55924bcc (ifplugd: install configuration files unconditionally)
> removed the conditional configuration file install, but left an redundant
> newline escape, causing the following error:
> 
> package/ifplugd/ifplugd.mk:23: *** missing 'endef', unterminated 'define'.  Stop.
> 
> Fix this.

In subject: s/excape/escape/

baruch

> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ifplugd/ifplugd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
> index 03ed8cdf33a2..6b6141e7b8b3 100644
> --- a/package/ifplugd/ifplugd.mk
> +++ b/package/ifplugd/ifplugd.mk
> @@ -24,7 +24,7 @@ define IFPLUGD_INSTALL_FIXUP
>  	$(INSTALL) -D -m 0644 $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
>  	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
>  	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
> -		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
> +		$(TARGET_DIR)/etc/ifplugd/ifplugd.action
>  endef
>  
>  IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
