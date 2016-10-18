From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 21:58:12 +0200
Subject: [Buildroot] [PATCH 36/93] 4th: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-37-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-37-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <6c999e41-e55c-14ee-b5c9-1120cf57d574@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:06, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/4th/4th.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/4th/4th.mk b/package/4th/4th.mk
> index 071c2d4..7828592 100644
> --- a/package/4th/4th.mk
> +++ b/package/4th/4th.mk
> @@ -17,9 +17,9 @@
>  4TH_CFLAGS = $(TARGET_CFLAGS) -DUNIX -fsigned-char
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -4TH_MAKE_ENV = STATIC=1
> +4TH_MAKE_ENV = $(TARGET_MAKE_ENV) STATIC=1

 I would have preferred 4TH_MAKE_ENV = $(TARGET_MAKE_ENV) outside the condition
and += inside, but that's just nitpicking.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>  else
> -4TH_MAKE_ENV = SHARED=1
> +4TH_MAKE_ENV = $(TARGET_MAKE_ENV) SHARED=1
>  4TH_CFLAGS += -fPIC
>  endif
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
