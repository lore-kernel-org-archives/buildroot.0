From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 16:09:49 +0100
Subject: [Buildroot] [PATCH v4 2/4] linux-pam: Enable NIS support if
 yp-tools selected
In-Reply-To: <1453647303-3965-3-git-send-email-yba@tkos.co.il>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-3-git-send-email-yba@tkos.co.il>
Message-ID: <20160124160949.00b03374@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Sun, 24 Jan 2016 16:55:01 +0200, Jonathan Ben-Avraham wrote:

> +ifeq ($(BR2_PACKAGE_YP_TOOLS),y)
> +LINUX_PAM_CONF_OPTS += \
> +	--enable-nis
> +else
> +LINUX_PAM_CONF_OPTS += \
> +	--disable-nis
> +endif

This patch should come *after* the yp-tools package is added in the
series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
