From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:28:34 +0200
Subject: [Buildroot] [PATCH 21/93] libpfm4: use $(TARGET_CONFIGURE_OPTS)
 when calling $(MAKE)
In-Reply-To: <1476720440-22239-22-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-22-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <cccbb513-afd6-d173-1dfa-84ce604b20e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Subject line is wrong: libpfm4 -> xl2tp

 Regards,
 Arnout

On 17-10-16 18:06, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/xl2tp/xl2tp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
> index a823716..29e2f28 100644
> --- a/package/xl2tp/xl2tp.mk
> +++ b/package/xl2tp/xl2tp.mk
> @@ -20,7 +20,7 @@ define XL2TP_BUILD_CMDS
>  endef
>  
>  define XL2TP_INSTALL_TARGET_CMDS
> -	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
>  endef
>  
>  $(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
