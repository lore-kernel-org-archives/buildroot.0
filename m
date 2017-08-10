From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:45:37 +0200
Subject: [Buildroot] [Patch v7 09/10] libcurl: add host variant
In-Reply-To: <20170723081206.7774-10-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-10-eric.le.bihan.dev@free.fr>
Message-ID: <8558ce88-9c19-a1d8-3566-ae9d2b354236@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:12, Eric Le Bihan wrote:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/libcurl/libcurl.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 6848449..0e216ca 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -82,4 +82,7 @@ endef
>  LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>  endif
>  
> +HOST_LIBCURL_DEPENDENCIES = host-openssl

 You also want HOST_LIBCURL_CONF_OPTS which disables as much as possible.

 You probably also want LIBCURL_FIX_DOT_PC.


 Regards,
 Arnout

> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
