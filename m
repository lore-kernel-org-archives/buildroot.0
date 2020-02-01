From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 23:02:24 +0100
Subject: [Buildroot] [PATCH 2/3] package/elixir: new package
In-Reply-To: <20200129172618.16966-2-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200129172618.16966-2-frank.vanbever@essensium.com>
Message-ID: <20200201230224.1a6f9c25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Jan 2020 18:26:17 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> +ELIXIR_VERSION = 1.9.4
> +ELIXIR_SITE = $(call github,elixir-lang,elixir,v$(ELIXIR_VERSION))
> +ELIXIR_LICENSE = Apache-2.0
> +ELIXIR_LICENSE_FILES = LICENSE
> +ELIXIR_DEPENDENCIES = erlang

It seems pretty bad/weird for a host package to depend on a target
package. We do have this situation already with host-gcc-final
depending on the target C library package.

Do you really need the target "erlang", and not just "host-erlang" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
