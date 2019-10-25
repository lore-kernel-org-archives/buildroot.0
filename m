From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 19:34:24 +0200
Subject: [Buildroot] [PATCH v2 3/3] toolchain-external: add support for
 D language
In-Reply-To: <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
 <20191024181621.29349-4-eric.le.bihan.dev@free.fr>
Message-ID: <20191025193424.2f217fb3@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 20:16:21 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> +config BR2_TOOLCHAIN_EXTERNAL_DLANG
> +	bool "Toolchain has D support?"
> +	select BR2_TOOLCHAIN_HAS_DLANG
> +	help
> +	  Select this option if your external toolchain has D
> +	  support. If you don't know, leave the default value,
> +	  Buildroot will tell you if it's correct or not.

This last sentence is not actually true: Buildroot doesn't check if
there is a really a D compiler in the external toolchain, as Romain
pointed out. So I've dropped this last sentence, and applied.

Could you send follow-up patches to address the limitations/issues that
Romain has raised ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
