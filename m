From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 17:10:10 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210621141130.48654-7-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-7-herve.codina@bootlin.com>
Message-ID: <20210621171010.3c54ec24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:21 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> This hook will be used by package infrastucture or some packages to tweak
> external files (ie files not provides by the package itself) when we build
> with BR2_PER_PACKAGE_DIRECTORIES set.
> 
> This allows to have these tweaks in a specific hook instead of
> <PKG>_POST_CONFIGURE_HOOK. And so we can call these specific tweaks
> whenever we need them.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I think this commit log needs an explanation as to why this is
necessary, i.e why isn't the current solution of POST_CONFIGURE_HOOKS
working.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
