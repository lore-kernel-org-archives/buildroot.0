From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:25:02 +0200
Subject: [Buildroot] [PATCH 1/5] gconf: use $() to reference make
 variables instead of ${}
In-Reply-To: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
Message-ID: <6e933c07-377c-5e8c-d822-2977017ff594@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 07:16, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

 Patches 1-4 applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gconf/gconf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
> index 39df95fbd2..60ced95e18 100644
> --- a/package/gconf/gconf.mk
> +++ b/package/gconf/gconf.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GCONF_VERSION = 3.2.6
> -GCONF_SOURCE = GConf-${GCONF_VERSION}.tar.xz
> +GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
>  GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
>  GCONF_CONF_OPTS = --disable-orbit
>  GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
