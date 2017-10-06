From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:00:52 +0200
Subject: [Buildroot] [PATCH] lbase64: fix build
In-Reply-To: <20170929165906.18974-1-francois.perrad@gadz.org>
References: <20170929165906.18974-1-francois.perrad@gadz.org>
Message-ID: <ac7f279e-49c9-d16d-69c8-5f5cd16e0fb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-09-17 18:59, Francois Perrad wrote:
> see http://autobuild.buildroot.net/results/b56/b567096cbfdb89b1895924051265c56204ffb512/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 I added a commit message and applied to master, thanks.

 However, wouldn't an upstreamable patch have been better?

 Regards,
 Arnout

> ---
>  package/lbase64/lbase64.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
> index fd78a6ccd..0225fc67c 100644
> --- a/package/lbase64/lbase64.mk
> +++ b/package/lbase64/lbase64.mk
> @@ -12,7 +12,8 @@ LBASE64_LICENSE_FILES = README
>  LBASE64_DEPENDENCIES = luainterpreter
>  
>  define LBASE64_BUILD_CMDS
> -	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) so
> +	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) so
>  endef
>  
>  define LBASE64_INSTALL_TARGET_CMDS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
