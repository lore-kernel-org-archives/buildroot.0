From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:16:45 +0200
Subject: [Buildroot] [PATCH 83/93] ezxml: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-84-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-84-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <6ecd0418-0ea7-cf70-38a0-363b39e7da90@mind.be>
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
>  package/ezxml/ezxml.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
> index 7693466..e2b288b 100644
> --- a/package/ezxml/ezxml.mk
> +++ b/package/ezxml/ezxml.mk
> @@ -11,7 +11,7 @@ EZXML_LICENSE = MIT
>  EZXML_LICENSE_FILES = license.txt
>  
>  define EZXML_BUILD_CMDS
> -	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
>  	-f GNUmakefile -C $(@D)

 Again, line too long. It would look better with the assignments on the second
line and -C $(@D) -f GNUmakefile on the first line.

 Regards,
 Arnout

>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
