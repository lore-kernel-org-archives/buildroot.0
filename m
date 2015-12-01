From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 21:46:32 +0100
Subject: [Buildroot] [PATCH 1/1] netsniff-ng:Prevent finding host
 installed nacl
In-Reply-To: <1448893710-21961-1-git-send-email-joris.lijssens@gmail.com>
References: <1448893710-21961-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <565E0728.50300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-11-15 15:28, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/netsniff-ng/netsniff-ng.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
> index 4fed88c..40eecab 100644
> --- a/package/netsniff-ng/netsniff-ng.mk
> +++ b/package/netsniff-ng/netsniff-ng.mk
> @@ -8,6 +8,10 @@ NETSNIFF_NG_VERSION = v0.5.9
>  NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
>  NETSNIFF_NG_LICENSE = GPLv2
>  NETSNIFF_NG_LICENSE_FILES = README COPYING
> +# Prevent netsniff-ng configure script from finding a host installed nacl
> +NETSNIFF_NG_CONF_ENV = \
> +	NACL_INC_DIR=/dev/null \
> +	NACL_LIB_DIR=/dev/null
>  NETSNIFF_NG_DEPENDENCIES = \
>  	libnl libpcap libcli libnetfilter_conntrack \
>  	liburcu libnet
> @@ -15,6 +19,7 @@ NETSNIFF_NG_DEPENDENCIES = \
>  # hand-written configure script and makefile
>  define NETSNIFF_NG_CONFIGURE_CMDS
>  	(cd $(@D); \
> +		$(NETSNIFF_NG_CONF_ENV) \
>  		$(TARGET_CONFIGURE_ARGS) \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		./configure \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
