From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 12:56:54 +0200
Subject: [Buildroot] [PATCH 1/3] package/systemd: add option to enable
 SysV and utmp compatibility
In-Reply-To: <20200710234150.185609-1-nolange79@gmail.com>
References: <20200710234150.185609-1-nolange79@gmail.com>
Message-ID: <20200711125654.4fcb48d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 01:41:47 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 05c1d1ff9a..05d8cb4934 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -199,6 +199,18 @@ else
>  SYSTEMD_CONF_OPTS += -Dpcre2=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSV),y)
> +SYSTEMD_CONF_OPTS += -Dsysvinit-path=/etc/init.d -Dsysvrcnd-path=/etc/rc.d

We don't have any /etc/rc.d directory in Buildroot, and when systemd is
selected as the init system, we don't install init scripts in
/etc/init.d. So I'm wondering what is the use case for this option ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
