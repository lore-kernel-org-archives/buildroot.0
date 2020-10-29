From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 13:50:17 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <20201029110632.25856-1-buildroot@heine.tech>
References: <20201029110632.25856-1-buildroot@heine.tech>
Message-ID: <20201029135017.652486f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Thu, 29 Oct 2020 12:06:33 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> -LIBGPIOD_VERSION = 1.4.1
> +# starting with 1.5 libgpiod depends on Headers >= 5.5
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5),y)
> +LIBGPIOD_VERSION = 1.6
> +else
> +LIBGPIOD_VERSION = 1.4.4
> +endif

Hum, this is a bit annoying. And upstream is not willing to have proper
conditional logic to keep supporting kernels older than 5.5 ? 5.5 is
not that old, it seems odd to so quickly drop support. Even 5.4 is the
current LTS kernel !

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
