From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:35:06 +0100
Subject: [Buildroot] [PATCH/next v3 4/4] package/polkit: enable systemd
 login support
In-Reply-To: <20191125175031.4086339-5-aduskett@gmail.com>
References: <20191125175031.4086339-1-aduskett@gmail.com>
 <20191125175031.4086339-5-aduskett@gmail.com>
Message-ID: <20191125213506.23a25ee0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 25 Nov 2019 09:50:31 -0800
aduskett at gmail.com wrote:

>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  POLKIT_CONF_OPTS += --with-authfw=pam
> @@ -26,6 +25,13 @@ else
>  POLKIT_CONF_OPTS += --with-authfw=shadow
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
> +POLKIT_DEPENDENCIES += systemd

systemd has an optional dependency on polkit, and here you are adding
an optional dependency of polkit on systemd. This is not going to work
well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
