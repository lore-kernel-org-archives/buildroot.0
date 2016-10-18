From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:18:41 +0200
Subject: [Buildroot] [PATCH 87/93] fmlib: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-88-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-88-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <78861b50-c769-927c-2585-83b989200ca4@mind.be>
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
>  package/fmlib/fmlib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
> index 42cdc27..1d3f3be 100644
> --- a/package/fmlib/fmlib.mk
> +++ b/package/fmlib/fmlib.mk
> @@ -31,7 +31,7 @@ endef
>  
>  define FMLIB_INSTALL_STAGING_CMDS
>  	$(RM) $(STAGING_DIR)/usr/lib/libfm.a
> -	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
> +	$(TARGET_MAKE_ENV) $(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)

 FMLIB_MAKE_ENV doesn't exist so you can just replace that one.

 Regards,
 Arnout

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
