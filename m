From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 8 Jul 2018 22:39:55 -0300 (BRT)
Subject: [Buildroot] [PATCH 16/50 v2] package/busybox: invert dependency
 with rsyslog
In-Reply-To: <68f785bd3f381be0d4371617fa06a60a51aa6d38.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <68f785bd3f381be0d4371617fa06a60a51aa6d38.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <891924259.2223860.1531100395258.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Original Message -----
> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>, "DATACOM" <casantos@datacom.com.br>
> Sent: Sunday, July 8, 2018 6:45:41 AM
> Subject: [PATCH 16/50 v2] package/busybox: invert dependency with rsyslog

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Carlos Santos <casantos@datacom.com.br>
> 
> ---
> Changes v1 -> v2:
>  - s/rsyslogd/rsyslog/  (Carlos)
> ---
> package/busybox/busybox.mk | 1 +
> package/rsyslog/rsyslog.mk | 5 -----
> 2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 00e17c4be6..22b798207a 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
> 
> # Packages that provide commands that may also be busybox applets:
> BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_RSYSLOGD),rsyslog) \
> 	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
> 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
> 	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index e32505be22..61e08ba765 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -17,11 +17,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
> RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
> 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
> 
> -# Build after BusyBox
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -RSYSLOG_DEPENDENCIES += busybox
> -endif
> -
> ifeq ($(BR2_PACKAGE_GNUTLS),y)
> RSYSLOG_DEPENDENCIES += gnutls
> RSYSLOG_CONF_OPTS += --enable-gnutls
> --
> 2.14.1

Reviewed-by: Carlos Santos <casantos@datacom.com.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
