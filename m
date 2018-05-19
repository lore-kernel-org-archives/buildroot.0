From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 10:38:14 +0200
Subject: [Buildroot] [PATCH] pkg-generic: error out with 'local' site
 method and no _SITE
In-Reply-To: <20180518104524.4630-1-arnout@mind.be>
References: <20180518104524.4630-1-arnout@mind.be>
Message-ID: <20180519103814.5cf1abae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 May 2018 12:45:24 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> +$$(error $(1) has local site method, but `$(2)_SITE_METHOD` is not defined)
> +endif

Are you sure it shouldn't be "$(2)_SITE" is not defined ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
