From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:09:09 +0200
Subject: [Buildroot] [PATCH 76/93] dtc: use $(TARGET_CONFIGURE_OPTS)
 when calling $(MAKE)
In-Reply-To: <1476720440-22239-77-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-77-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <28041397-8296-02fe-1c71-b7a4c691c358@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:07, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/dtc/dtc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 8fdcdbe..01699bb 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -37,12 +37,12 @@ endef
>  
>  # For staging, only the library is needed
>  define DTC_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \

 Why TARGET_CONFIGURE_OPTS instead of TARGET_MAKE_ENV?

 Also, the line is a bit long and it anyway makes more sense to have install-lib
and install-includes on the same line.

 Regards,
 Arnout

>  		install-includes
>  endef
>  
>  define DTC_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
>  endef
>  
>  # host build
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
