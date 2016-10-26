From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 26 Oct 2016 11:32:45 +0530
Subject: [Buildroot] [PATCH v13 4/8] util-linux: selinux, audit,
 and pam support
In-Reply-To: <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-4-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <58104705.2010806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 26 October 2016 12:56 AM, Bryce Ferguson wrote:
>
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index bd6508c..934fe2f 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -63,6 +63,20 @@ endif
>   UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
>   UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
>
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +UTIL_LINUX_DEPENDENCIES += libselinux
> +UTIL_LINUX_CONF_OPTS += --with-selinux
> +else
> +UTIL_LINUX_CONF_OPTS += --without-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +UTIL_LINUX_DEPENDENCIES += audit
> +UTIL_LINUX_CONF_OPTS += --with-audit
> +else
> +UTIL_LINUX_CONF_OPTS += --without-audit
> +endif
> +

util-linux already has optional dependency on audit package.

Regards,
Rahul
