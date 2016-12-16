From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Dec 2016 09:10:22 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: enable selinux if libselinux
 is selected.
In-Reply-To: <MWHPR19MB1440119476458B1DB7D8E1B9B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
References: <MWHPR19MB1440119476458B1DB7D8E1B9B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
Message-ID: <20161216091022.61a7d4d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Dec 2016 21:23:12 +0000, Adam Duskett wrote:

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index fa07bd0..ca1f49e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -30,7 +30,6 @@ SYSTEMD_CONF_OPTS += \
>  	--enable-blkid \
>  	--enable-static=no \
>  	--disable-manpages \
> -	--disable-selinux \
>  	--disable-pam \
>  	--disable-ima \
>  	--disable-libcryptsetup \
> @@ -153,6 +152,12 @@ else
>  SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +SYSTEMD_CONF_OPTS += --enable-selinux

This lacks:

SYSTEMD_DEPENDENCIES += libselinux

Otherwise you are not guarantee that libselinux will be built before
systemd.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
