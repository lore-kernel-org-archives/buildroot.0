From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jun 2013 15:09:04 +0200
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130616130904.GD3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, All,

On 2013-06-16 12:34 +0100, spdawson at gmail.com spake thusly:
> +config BR2_PACKAGE_GPSD_INSTALL_INITSCRIPT
> +	bool "install init script"
> +	default y
> +	depends on BR2_PACKAGE_GPSD
> +	help
> +	  Install a gpsd init script
> +

Why would one not want the init script? Is this because of systemd? If so,
then you should use GPSD_INSTALL_INIT_SYSV and GPSD_INSTALL_INIT_SYSTEMD
as pointed out by Maxime.

This ensures the init script will only be installed if a SysV init
scheme is used (and conversely for the systemd unit).

Otherwise, please expand on why not wanting the init script should be
configurable at all.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
