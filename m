From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:03:37 +0100
Subject: [Buildroot] [PATCH] eeprog: remove package
In-Reply-To: <39d02849d93281d09a8dace211b69df3e925b43e.1514832012.git.baruch@tkos.co.il>
References: <39d02849d93281d09a8dace211b69df3e925b43e.1514832012.git.baruch@tkos.co.il>
Message-ID: <20180101230337.213a84e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Jan 2018 20:40:12 +0200, Baruch Siach wrote:

> +config BR2_PACKAGE_EEPROG
> +	bool "eeprog package removed"
> +	select BR2_PACKAGE_I2C_TOOLS if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

Shouldn't we instead select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, to make
sure i2c-tools is really selected? Indeed, eeprog didn't depend on
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, so it is very possible for a user to
have BR2_PACKAGE_EEPROG=y without BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y.

Also, this should select BR2_LEGACY.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
