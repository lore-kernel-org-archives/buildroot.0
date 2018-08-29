From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 22:04:38 +0200
Subject: [Buildroot] [PATCH/next] qemu: add an option to enable user
 mode networking (SLIRP)
In-Reply-To: <20180827201501.24224-1-casantos@datacom.com.br>
References: <20180827201501.24224-1-casantos@datacom.com.br>
Message-ID: <20180829220438.5a5c71ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 17:15:01 -0300, Carlos Santos wrote:
> User mode networking is a useful feature that does not depend on other
> packages. Add an option to enable it but keep it disabled by default,
> for backwards compatibility.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

I've applied to next, with some minor tweaks, see below.


> +config BR2_PACKAGE_QEMU_SLIRP
> +	bool "Keep user mode networking (SLIRP)"

I understand you want to use "Keep" because SLIRP is normally enabled
by default in Qemu, and enabling this option allows to "keep" it.

However, I don't think such details really need to surface up to the
Config.in option prompts, so I've changed "Keep" to "Enable".

Indeed, if the option is selected, SLIRP support is enabled, if the
option is not selected SLIRP support is disabled.

> +	help
> +	  Keep user mode network stack, which is the default networking

I've changed Keep to Enable here as well.


> +# There is no "--enable-slirp"
> +ifneq ($(BR2_PACKAGE_QEMU_SLIRP),y)

and used positive logic here:

ifeq ($(BR2_PACKAGE_QEMU_SLIRP),)

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
