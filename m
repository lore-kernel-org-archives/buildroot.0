From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 20:45:28 +0100
Subject: [Buildroot] [PATCH] package/waf: purge trailig '/' from WAF_SITE
In-Reply-To: <20181210184559.13181-1-casantos@datacom.com.br>
References: <20181210184559.13181-1-casantos@datacom.com.br>
Message-ID: <20181210204528.6cd1409d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 16:45:59 -0200, Carlos Santos wrote:
> <PKG>_SITE cannot have a trailing slash.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Odd, why isn't our check in package/pkg-generic.mk for trailing slashes
triggering on this?

We have this:

ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
$$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
