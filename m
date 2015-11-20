From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 22:57:19 +0100
Subject: [Buildroot] [PATCH 2/2] libnet: PF_PACKET is always available
 on Linux
In-Reply-To: <1448033368-8081-2-git-send-email-joris.lijssens@gmail.com>
References: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
 <1448033368-8081-2-git-send-email-joris.lijssens@gmail.com>
Message-ID: <564F973F.7080907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 16:29, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/libnet/libnet.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
> index 3b62a79..1a5e610 100644
> --- a/package/libnet/libnet.mk
> +++ b/package/libnet/libnet.mk
> @@ -7,7 +7,10 @@
>  LIBNET_VERSION = 1.1.6
>  LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
>  LIBNET_INSTALL_STAGING = YES
> +# PF_PACKET is always available on Linux
> +LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
>  LIBNET_LICENSE = BSD-2c, BSD-3c
>  LIBNET_LICENSE_FILES = doc/COPYING
>  
> +

 This change is unnessary, but that can be fixed up during commit. Otherwise:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
