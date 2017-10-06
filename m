From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:06:31 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/libbcg729: new package
In-Reply-To: <20171004210224.12763-1-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
Message-ID: <c5a2686c-cc01-d484-559b-a56850365ac0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

On 04-10-17 23:02, Bernd Kuhls wrote:
> Quoting http://www.linphone.org/technical-corner/bcg729/downloads
> regarding patent information:
> 
> "ITU G729 Annex A/B were offically released October/November 1996
> (https://www.itu.int/rec/T-REC-G.729), hence all patents covering these
> specifications shall have expired in November 2016.
> 
> Patent pool administrator confirmed most licensed patents under the
> G.729 Consortium have expired (http://www.sipro.com/G729.html)."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[snip]
> diff --git a/package/libbcg729/libbcg729.mk b/package/libbcg729/libbcg729.mk
> new file mode 100644
> index 0000000000..2f1c12dfa5
> --- /dev/null
> +++ b/package/libbcg729/libbcg729.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libbcg729
> +#
> +################################################################################
> +
> +LIBBCG729_VERSION = 1.0.4
> +LIBBCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(LIBBCG729_VERSION))

 We normally use the upstream name, so bcg729 instead of libbcg729.

 With that, you can can add my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> +LIBBCG729_LICENSE = GPL-2.0+
> +LIBBCG729_LICENSE_FILES = COPYING
> +LIBBCG729_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBBCG729_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LIBBCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBBCG729_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
