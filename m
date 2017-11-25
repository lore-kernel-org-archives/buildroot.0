From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:23:57 +0100
Subject: [Buildroot] [PATCH] axel: bump to version 2.16
In-Reply-To: <20171125044447.7188-1-ismael@iodev.co.uk>
References: <20171125044447.7188-1-ismael@iodev.co.uk>
Message-ID: <20171125132357.7431e5c1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 01:44:47 -0300, Ismael Luceno wrote:
> - Change upstream URL.
> - Add optional dependency on libressl/openssl.
> - Switch to autotools-package.
> 
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

I've applied to next, but now that I review the patch again, I see a
problem, see below.

> +ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +AXEL_CONF_OPTS += --with-ssl
> +AXEL_DEPENDENCIES += libressl

This is not needed, because the below case with BR2_PACKAGE_OPENSSL is
sufficient. Indeed openssl is not a virtual package, that depends
either on libopenssl or libressl depending on which implementation is
selected.

> +else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +AXEL_CONF_OPTS += --with-ssl
> +AXEL_DEPENDENCIES += openssl

Could you send a follow-up patch (based on the next branch) that fixes
this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
