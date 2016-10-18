From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:47:16 +0200
Subject: [Buildroot] [PATCH 49/93] lzip: use $(HOST_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-50-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-50-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <83c28345-7de1-d93c-f0c0-9da0737dfa66@mind.be>
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
>  package/lzip/lzip.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
> index 7b1fdf4..60555c5 100644
> --- a/package/lzip/lzip.mk
> +++ b/package/lzip/lzip.mk
> @@ -24,7 +24,7 @@ define LZIP_BUILD_CMDS
>  endef
>  
>  define HOST_LZIP_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)

 How about CONFIGURE_CMDS? Even though this custom configure script doesn't
compile anything, it could do so in the future.

 Regards,
 Arnout

>  endef
>  
>  define LZIP_INSTALL_TARGET_CMDS
> @@ -32,7 +32,7 @@ define LZIP_INSTALL_TARGET_CMDS
>  endef
>  
>  define HOST_LZIP_INSTALL_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
>  endef
>  
>  # It's not autotools-based
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
