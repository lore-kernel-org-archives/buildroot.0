From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:13:44 +0200
Subject: [Buildroot] [PATCH 18/51] ncurses: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-19-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-19-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <e90ba386-2dab-07ce-edae-b1bce091f199@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>


 Could you add a patch that does the same for host-ncurses as well?

 Regards,
 Arnout

> ---
>  package/ncurses/ncurses.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 2764824..9555f1e 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -127,9 +127,9 @@ endif
>  # ncurses breaks with parallel build, but takes quite a while to
>  # build single threaded. Work around it similar to how Gentoo does
>  define NCURSES_BUILD_CMDS
> -	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
>  	rm -rf $(@D)/misc/pc-files
> -	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
>  endef
>  
>  ifneq ($(BR2_STATIC_LIBS),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
