From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:41:53 +0200
Subject: [Buildroot] [Patch v7 08/10] libhttpparser: add host variant
In-Reply-To: <20170723081206.7774-9-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-9-eric.le.bihan.dev@free.fr>
Message-ID: <1c151425-25f5-4d3d-0143-044f51f4cc2f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:12, Eric Le Bihan wrote:
> Allow build of host variant of libhttpparser.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/libhttpparser/libhttpparser.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
> index 015efc0..475dfde 100644
> --- a/package/libhttpparser/libhttpparser.mk
> +++ b/package/libhttpparser/libhttpparser.mk
> @@ -23,4 +23,13 @@ define LIBHTTPPARSER_INSTALL_TARGET_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
>  endef
>  
> +define HOST_LIBHTTPPARSER_BUILD_CMDS
> +	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) library package
> +endef
> +
> +define HOST_LIBHTTPPARSER_INSTALL_CMDS
> +	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) PREFIX=$(HOST_DIR)/usr install

 /usr is gone.

 Regards,
 Arnout

> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
