From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:03:36 +0200
Subject: [Buildroot] [PATCH 08/51] librtas: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-9-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-9-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <2a349e97-8268-0c92-5614-d738445645cd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/librtas/librtas.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
> index 6e1ebd1..0af47e0 100644
> --- a/package/librtas/librtas.mk
> +++ b/package/librtas/librtas.mk
> @@ -15,11 +15,11 @@ define LIBRTAS_BUILD_CMDS
>  endef
>  
>  define LIBRTAS_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install

 Hm, the LIBRTAS_BUILD_COMMANDS use TARGET_CONFIGURE_OPTS instead of
TARGET_MAKE_ENV. So perhaps it nicer to use TARGET_CONFIGURE_OPTS as well for
the install commands?

 Regards,
 Arnout


>  endef
>  
>  define LIBRTAS_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
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
