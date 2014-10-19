From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:46:39 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Change default to
 X.org modular server on supported platforms
In-Reply-To: <1413744694-27659-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413744694-27659-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019224639.2a61c29a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 20:51:34 +0200, Bernd Kuhls wrote:

>  choice
>  	prompt "X Window System server type"
> +	default BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR if (BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
>  	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE

While I don't object to changing to the modular server by default, I
find it weird to have a default that is different depending on the
toolchain configuration.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
