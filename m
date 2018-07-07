From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:26:44 +0200
Subject: [Buildroot] [PATCH] systemd: Fix polkit build order
In-Reply-To: <20180704203624.12391-1-yann.morin.1998@free.fr>
References: <20180704203624.12391-1-yann.morin.1998@free.fr>
Message-ID: <c16d5eab-4ee8-3408-8239-adfd86c092ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-18 22:36, Yann E. MORIN wrote:
> From: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
> 
> We need to install polkit before systemd if we want to enable
> polkit integration, because systemd will not install polkit
> policy files unless it finds polkit-gobject-1.
> 
> Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Applied to master, thanks.

 Regards,
 Arnout

> 
> ---
> I've resent this, as Asgeir does not seem to be subscribed to the list.
> Asgeir, if you want to send more patches (which we encourage you to
> do!), you'll need to subscribe to the list first.
> 
> Thanks! :-)
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 10e11a9277..04775ee778 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -283,6 +283,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
>  SYSTEMD_CONF_OPTS += -Dpolkit=true
> +SYSTEMD_DEPENDENCIES += polkit
>  else
>  SYSTEMD_CONF_OPTS += -Dpolkit=false
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
