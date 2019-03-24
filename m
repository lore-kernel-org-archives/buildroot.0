From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Mar 2019 14:05:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add optional
 nftables dependency
In-Reply-To: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
References: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
Message-ID: <87h8bsmq9q.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Mar 24 2019, Fabrice Fontaine wrote:
> nftables support has been added since version 2.0.11 and
> https://github.com/acassen/keepalived/commit/aa12175ea638912a7789e832634d7ccf80fdf48d
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index fcdb43ce13..d93f8be057 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -46,4 +46,14 @@ else
>  KEEPALIVED_CONF_OPTS += --disable-libiptc
>  endif
>  
> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
> +KEEPALIVED_DEPENDENCIES += iptables
> +KEEPALIVED_CONF_OPTS += --enable-nftables

What do you need that for? Please explain in the commit log and in an
inline comment.

> +else ifeq ($(BR2_PACKAGE_NFTABLES),y)
> +KEEPALIVED_DEPENDENCIES += nftables
> +KEEPALIVED_CONF_OPTS += --enable-nftables
> +else
> +KEEPALIVED_CONF_OPTS += --disable-nftables
> +endif
> +
>  $(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
